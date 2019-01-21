# json.array! @products.each do |product|
#   json.partial! product, partial: "product", as: :product
# end


json.array! @products, partial: "product", as: :product