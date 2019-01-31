class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders #if current user exists, by logging in, then execute this block, which displays all the orders for the current user. using the orders association method defined by the belongs_to method in the model
    render 'index.json.jbuilder'
  end
  
  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    product = Product.find(params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.new(
                      user_id: current_user.id, 
                      product_id: params[:product_id],
                      quantity: params[:quantity],
                      subtotal: calculated_subtotal,
                      tax: calculated_tax,
                      total: calculated_total
                      )
    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
