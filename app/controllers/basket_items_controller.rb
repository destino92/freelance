class BasketItemsController < ApplicationController
  include CurrentBasket
  before_action :set_basket_item, only: [:show, :edit, :update, :destroy]
  before_action :set_basket, only: [:create]  

  # GET /basket_items
  # GET /basket_items.json
  def index
    @basket_items = BasketItem.all
  end

  # GET /basket_items/1
  # GET /basket_items/1.json
  def show
  end

  # GET /basket_items/new
  def new
    @basket_item = BasketItem.new
  end

  # GET /basket_items/1/edit
  def edit
  end

  # POST /basket_items
  # POST /basket_items.json
  def create
    @gig = Gig.find(params[:gig_id])
    @basket_item = @basket.add_gig(@gig)

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to @basket_item.basket, notice: 'Successfully added to basket.' }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { render :new }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basket_items/1
  # PATCH/PUT /basket_items/1.json
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to @basket_item, notice: 'Basket item was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { render :edit }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1
  # DELETE /basket_items/1.json
  def destroy
    #@basket = Basket.find(params[:basket_id])
    @basket_item.destroy
    respond_to do |format|
      format.html { redirect_to basket_path(@basket), notice: 'Basket item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket_item
      @basket_item = BasketItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_item_params
      params.require(:basket_item).permit(:gig_id, :basket_id)
    end
end
