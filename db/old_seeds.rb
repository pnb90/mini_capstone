# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.create!([
  {name: "Religieuse", price: "5.0", image_url: "http://www.dalloyau.fr/media/catalog/product/cache/1/image/360x/9df78eab33525d08d6e5fb8d27136e95/r/e/religieuse_2_1_1.jpg", description: "Looks like a nun!", in_stock: nil},
  {name: "Paris-Brest", price: "5.0", image_url: "https://www.bakefromscratch.com/wp-content/uploads/2017/02/Paris-Brest-696x566.jpg", description: "Like an eclair, but in a circle", in_stock: nil},
  {name: "Eclair", price: "4.0", image_url: "https://www.seriouseats.com/images/2015/05/03252015-meuille-feuille-best-eclairs-in-NYC-combo-niko-triantafillou-edit.jpg", description: "Choux pastry filled with pastry cream and topped with chocolate!", in_stock: nil},
  {name: "Chocolate Cronut", price: "5.0", image_url: "http://www.attibassicafe.com/wp-content/uploads/2014/03/11848677353_f2ec883e20_o.jpg", description: "A croissant donut filled with chocolate - TASTYYY!", in_stock: nil},
  {name: "Croissant", price: "3.0", image_url: "http://images.ctfassets.net/3s5io6mnxfqz/3qjYZapbKo2iwaWYi2wAgQ/6cc9c19131ba9402b284883d00c01d45/image1.png", description: "buttery flaky goodness!", in_stock: nil},
  {name: "Kouign Amann", price: "4.0", image_url: "https://www.mackenzieltd.com/media/catalog/product/cache/1/image/720x/7680e3fb5d76190fb082a1c73a7407b1/a/-/a-442-01.png", description: "even MORE butter and sugar than a croissant!", in_stock: nil},
  {name: "Bánh Patê Sô", price: "5.0", image_url: "https://1.bp.blogspot.com/-eUWs5tUojmo/VCZq71YaZjI/AAAAAAAAYoQ/gHOrtpXSda4/s1600/092714maaf-patechaudbanhpateso09.jpg", description: "Vietnamese puff pastry filled with meat and spices", in_stock: nil}
])
