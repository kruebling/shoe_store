require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#Index Routes
get('/') do
  @brands = Brand.all()
  @stores = Store.all
  erb(:index)
end

get('/create_store') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post('/create_store') do
  name = params['name']
  store = Store.create({:name => name})
  @stores = Store.all().sort_by {|sort| sort.name}
  @brands = Brand.all()
  erb(:index)
end

get('/create_brand') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post('/create_brand') do
  brand = params['brand']
  price = params['price']
  brand = Brand.create({:brand => brand, :price => price})
  @brands = Brand.all().sort_by {|sort| sort.brand}
  @stores = Store.all()
  erb(:index)
end
#End Index Routes

#Info Routes
