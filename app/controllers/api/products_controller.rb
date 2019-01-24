class Api::ProductsController < ApplicationController

  def index
    @products = Product.all

    search_terms = params[:search]
    if search_terms
      @products = @products.where("name iLIKE ?", "%#{search_terms}%")
    end

    price = params[:sort]
    if price
      @products = @products.order(price: "ASC")
    end

    desc = params[:sort_order]
    if desc
      @products = @products.order(price: "DESC")
    end

    discounted = params[:discounted]
    if discounted
      @products = @products.where("price <= ?", 3)
    end

    @products = @products.order(id: "ASC")


    render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            image_url: params[:image_url],
                            description: params[:description]
                          )
    if @product.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)

    @product.name = params[:name] || @product.name 
    @product.price = params[:price] || @product.price 
    @product.image_url = params[:image_url] || @product.image_url 
    @product.description = params[:description] || @product.description 
    @product.in_stock = params[:in_stock] || @product.in_stock 

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    product_id = params[:id]
    product = Product.find(product_id)

    product.destroy
    render json: {message: "Product successfully removed."}
  end

end
