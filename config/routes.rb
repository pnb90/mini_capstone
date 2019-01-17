Rails.application.routes.draw do
  namespace :api do
    get "/first_product" => 'products#first_product'
    get "/all_products" => 'products#all_products'

    get "/query_product" => 'products#query_product'

    get "/segment_product" => 'products#segment_product'
  end
end
