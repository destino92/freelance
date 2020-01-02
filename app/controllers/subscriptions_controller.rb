class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, only: [:subscribe]
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def subscribe
    if !current_user.stripe_id?
      return redirect_to edit_payment_path, alert: "Please add your card before subscribing"
    end

    plan = Stripe::Plan.retrieve(params[:plan_id])
    if !plan.id 
      return redirect_to request.referrer, alert: "Invalid Plan"
    end

    subscription = Subscription.exists?(user_id: current_user.id)
    if subscription.present?
      return redirect_to request.referrer, alert: "you cannot subscribe to another plan"
    end

    stripe_sub = Stripe::Subscription.create(
      customer: current_user.stripe_id,
      items: [{ plan: plan.id }]
      )


    subscription = Subscription.create(
      user_id: current_user.id,
      plan_id: plan.id,
      sub_id: stripe_sub.id
      ) 

    return redirect_to dashboard_path, notice: "Subscribed successfully"
  end 


  def webhook
    begin
      event_json = JSON.parse(request.body.read)
      event_object = event_json['data']['object']

      case event_json['type']
      when 'invoice.payment_succeeded'
        stripe_sub_id = event_object['subscription']
        subscription = Subscription.find_by_sub_id(stripe_sub_id)

        if subscription.expired_at.nil?
          expired_at = Date.current + 1.month
        else
          expired_at = subscription.expired_at + 1.month
        end
        subscription.update(status: Subscription.statuses[:success], expired_at: expired_at)

      when 'invoice.payment_failed'
        stripe_sub_id = event_object['subscription']
        subscription = Subscription.find_by_sub_id(stripe_sub_id)
        subscription.update(status: Subscription.statuses[:pending])

      when 'customer.subscription.deleted'
        stripe_sub_id = event_object['id']
        subscription = Subscription.find_by_sub_id(stripe_sub_id)
        subscription.destroy
      end

    rescue Exception => e 
      render :json => { status: 4222, error: e }
      return
    end

    render :json => { status: 200}

  end
end