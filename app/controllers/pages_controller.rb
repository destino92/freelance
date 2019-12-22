class PagesController < ApplicationController
  def home
  end


  def search
    @categories = Category.all
    @category = Category.find(params[:category]) if params[:category].present?


    # @gigs = Gig.where("active = ? AND gigs.title ILIKE ? AND category_id = ?", true, "%#{params[:q]}%", params[:category])
    @q = params[:q]

    @min = params[:min]
    @max = params[:max]
    @delivery = params[:delivery].present? ? params[:delivery] : "0"
    @sort = params[:sort].present? ? params[:sort] : "price asc"

    query_condition = []
    query_condition[0] = "gigs.active = true"
    query_condition[0] += " AND ((gigs.has_single_pricing = true AND pricings.pricing_type = 0) OR (gigs.has_single_pricing = false))"

    if !@q.blank?
      query_condition[0] += " AND gigs.title ILIKE ?"
      query_condition.push "%{@q}%"
    end

    if !params[:category].blank?
      query_condition[0] += " AND category_id = ?"
      query_condition.push params[:category]
    end

        if !params[:min].blank?
      query_condition[0] += " AND pricings.price >= ?"
      query_condition.push @min
    end

       if !params[:max].blank?
      query_condition[0] += " AND pricings.price <= ?"
      query_condition.push @max
    end

     if !params[:delivery].blank? && params[:delivery] != "0"
      query_condition[0] += " AND pricings.delivery_time <= ?"
      query_condition.push @delivery
    end

    @gigs = Gig
    .select("gigs.id, gigs.title, gigs.user_id, MIN(pricings.price) AS price")
    .joins(:pricings).where(query_condition)
    .group("gigs.id")
    .order(@sort)
    .page(params[:page])
    .per(6)


end
end
