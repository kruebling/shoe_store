require 'bundler/setup'
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
  @stores = Store.all().sort_by {|sort| sort.name}
  @brands = Brand.all()
  erb(:index)
end

post('/create_store') do
  name = params['name']
  @store = Store.new({:name => name})
    if @store.save
      redirect('/create_store')
    else
      erb(:store_error)
  end
end

get('/create_brand') do
  @stores = Store.all()
  @brands = Brand.all().sort_by {|sort| sort.brand}
  erb(:index)
end

post('/create_brand') do
  brand = params['brand']
  price = params['price']
  @brand = Brand.new({:brand => brand, :price => price})
    if @brand.save
      redirect('/create_brand')
    else
      erb(:brand_error)
  end
end
#End Index Routes

#Info Routes
get('/store/:id') do
  @store = Store.find(params[:id])
  @brands = Brand.all
  @unused_brands = @brands - @store.brands
  erb(:store_info)
end

post('/add_brand/:id') do
  store = Store.find(params[:id])
  brands = Brand.all
  brand_ids = params['brand_ids']
  brand_ids.each do |brand_id|
    store.brands.push(Brand.find(brand_id))
  end
  redirect "/store/#{store.id}"
end

delete("/store/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete
  @stores = Store.all()
  redirect "/"
end

patch("/store/:id") do
  rename = params.fetch('rename')
  @Store = Store.find(params.fetch("id").to_i())
  @Store.update({:name => rename})
  @Store = Store.all()
  redirect '/'
end

get('/brand/:id') do
  @brand = Brand.find(params[:id])
  @stores = Store.all
  erb(:brand_info)
end
