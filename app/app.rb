ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/api.rb'
require 'dotenv'
Dotenv.load

class App < Sinatra::Base

  API_KEY = ENV['API_KEY']
  API_USER = ENV['API_USER']

  get '/' do
    erb :index
  end

  post '/home' do
    @api = Api.new
    response = @api.authenticate(API_USER, API_KEY)
    @token = response.body["token"]
    erb :home
  end

  run! if app_file == $0
end
