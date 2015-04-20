class CartsController < ApplicationController
  before_filter :set_cart, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @carts = Cart.all
    respond_with(@carts)
  end

  def show
    respond_with(@cart)
  end

  def new
    @cart = Cart.new
    respond_with(@cart)
  end

  def edit
  end

  def add_to_cart
    p session["market_id"]
    market_id = session["market_id"]
    p session["warden.user.user.key"][0][0]
    user_id = session["warden.user.user.key"][0][0]
    product_id = params[:product_id]
    quantity = params[:quantity]

    cart = Cart.new(:user_id => user_id, :Product_id => product_id, :FarmersMarket_id => market_id, :quantity => quantity)
    cart.save
    respond_to do |format|
      msg = Hash.new
      format.json {render :json => msg}
    end
  end

  def create
    @cart = Cart.new(params[:cart])
    @cart.save
    respond_with(@cart)
  end

  def update
    @cart.update_attributes(params[:cart])
    respond_with(@cart)
  end

  def destroy
    @cart.destroy
    respond_with(@cart)
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end
end
