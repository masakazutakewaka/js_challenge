require 'sinatra/base'
require "sinatra/activerecord"

class App < Sinatra::Base
  configure :development do
    require 'byebug'
  end

  get '/' do
    haml :index, format: :html5
  end

  post '/search' do
    "#{params[:id]} is enterd"
  end
end
