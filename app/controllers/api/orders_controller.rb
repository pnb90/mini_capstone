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
    # product = Product.find(params[:product_id])
    carted_products = current_user.carted_products.where(status: "carted")
    
    calculated_subtotal = 0

    carted_products.each do |carted_product|
      current_product_id = carted_product.product_id
      calculated_subtotal += carted_product.quantity * Product.find(current_product_id).price
    end 

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.new(
                      user_id: current_user.id, 
                      subtotal: calculated_subtotal,
                      tax: calculated_tax,
                      total: calculated_total
                      )

    if @order.save
      carted_products.each do |carted_product| 
        carted_product.status = "purchased"
        carted_product.order_id = @order.id
        carted_product.save
      end 
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
