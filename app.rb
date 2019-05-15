require 'sinatra/base'
require "sinatra/activerecord"
require "./models/product"

class App < Sinatra::Base
  configure :development do
    require 'byebug'
  end

  get '/' do
    haml :index, format: :html5
  end

  post '/search' do
    p = Product.create!(asin: params[:id], category: 'baby', rank: 43, dimension: "32 X 33 X 55")
    haml :product, format: :html5, locals: { product: p }
  end
end
