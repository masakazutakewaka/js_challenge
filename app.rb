require 'sinatra/base'
require "sinatra/activerecord"
require "./models/product"
require "./models/crawler"

class App < Sinatra::Base
  set :show_exceptions, :after_handler # need this to invoke error handlers

  configure :development do
    require 'byebug'
  end

  error Crawler::NotFoundError do
    "The item was not found"
  end

  error Crawler::ParseError do
    "failed to parse the page"
  end

  get '/' do
    haml :index, format: :html5
  end

  post '/search' do
    url = "https://www.amazon.com/dp/#{params[:id]}"
    crawler = Crawler.new(url)
    product = Product.create!(crawler.parsed_result)
    haml :product, format: :html5, locals: { product: product }
  end
end
