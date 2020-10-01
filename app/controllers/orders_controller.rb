class OrdersController < ApplicationController
    include CurrentBasket
    before_action :authenticate_user!
    before_action :is_authorized, only: [:show]

    def new
        @order = Order.new
    end
    
    def create
        basket = Basket.find(id = session[:basket_id])
        basket_items = basket.basket_items

        basket_items.each do |item| 
            gig = item.gig
            order = gig.orders.new
            order.due_date = Date.today() + 1
            order.title = gig.title
            order.seller_name = gig.user.full_name
            order.seller_id = gig.user.id
            order.buyer_name = current_user.full_name
            order.buyer_id = current_user.id
            order.amount = gig.price

            order.save
        end
        basket.basket_items.destroy_all
        flash[:notice] = "Votre commande a été crée avec succes"
        return redirect_to buying_orders_path
        #pricing = gig.pricings.find_by(pricing_type: params[:pricing_type])

        #if (pricing && !gig.has_single_pricing) || (pricing && pricing.basic? && gig.has_single_pricing)
        #    if charge(gig, pricing)
        #        return redirect_to buying_orders_path
        #    end
        #else
        #    flash[:alert] = "Price is incorrect"
        #end

        #return redirect_to request.referrer
    end

    def selling_orders
        @orders = current_user.selling_orders
    end

    def buying_orders
        @orders = current_user.buying_orders
    end

    def complete
        @order = Order.find(params[:id])

        if !@order.completed?
            if @order.completed!
                flash[:notice] = "Saved..."
            else
                flash[:aler] = "Something went wrong..."
            end

            redirect_to request.referrer
        end
    end

    def show
        @order = Order.find(params[:id])
        @gig = @order.gig_id ? Gig.find(@order.gig_id) : nil
        @request = @order.request_id ? Request.find(@order.request_id) : nil
        @comments = Comment.where(order_id: params[:id])
    end

    private

    def is_authorized
        redirect_to dashboard_path, alert: "You don't have permission" unless Order.where("id = ? AND (seller_id = ? OR buyer_id = ?",
                                                                                   params[:id], current_user.id, current_user.id)
    end

=begin
    def charge(gig, pricing)

        subscription = Subscription.find_by_user_id(current_user.id)
        if subscription.present? && subscription.success?
        plan = Stripe::Plan.retrieve(subscription.plan_id)
        @rate = plan.metadata.commission.to_f/100
        else
        rate = 10.0/100
        end

        amount = pricing.price * (rate + 1)

        order = gig.orders.new
        order.due_date = Date.today() + pricing.delivery_time.days
        order.title = gig.title
        order.seller_name = gig.user.full_name
        order.seller_id = gig.user.id
        order.buyer_name = current_user.full_name
        order.buyer_id = current_user.id
        order.amount = amount



        if params[:payment].blank?
            flash[:alert] = "No payment selected"
            return false
        elsif params[:payment] == "system"
            if amount > current_user.wallet
                flash[:alert] = "Not enought money"
                return false
            else
                ActiveRecord::Base.transaction do
                    current_user.update!(wallet: current_user.wallet - amount)
                    gig.user.update!(wallet: gig.user.wallet + pricing.price)
                    Transaction.create! status: Transaction.statuses[:approved],
                                        transaction_type: Transaction.transaction_types[:trans],
                                        source_type: Transaction.source_types[:system],
                                        buyer: current_user,
                                        seller: gig.user,
                                        amount: amount,
                                        gig: gig
                    order.save
                end
                flash[:notice] = "Your order is created successfully"
                return true
            end
        else
            charge = Stripe::Charge.create({
                amount: (amount * 100).to_i,
                currency: 'usd',
                customer: current_user.stripe_id,
                source: params[:payment],
            })

            if charge.paid
                ActiveRecord::Base.transaction do
                    gig.user.update!(wallet: gig.user.wallet + pricing.price)
                    Transaction.create! status: Transaction.statuses[:approved],
                                        transaction_type: Transaction.transaction_types[:trans],
                                        source_type: Transaction.source_types[:stripe],
                                        buyer: current_user,
                                        seller: gig.user,
                                        amount: amount,
                                        gig: gig
                    order.save
                end
                flash[:notice] = "Your order is created successfully"
                return true
            end
            flash[:alert] = "Invalid card"
            return false
        end

    rescue ActiveRecord::RecordInvalid
        flash[:alert] = "Something went wrong"
        return false
    end
=end
end