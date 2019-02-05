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
    @order = Order.new(user_id: current_user.id)
    render 'show.json.jbuilder'
  end

end
