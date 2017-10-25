ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/api.rb'
require 'dotenv'
require 'json'
Dotenv.load

class App < Sinatra::Base
  enable :sessions

  API_KEY = ENV['API_KEY']
  API_USER = ENV['API_USER']

  get '/' do
    erb :index
  end

  post '/home' do
    @api = Api.new
    response = @api.login(API_USER, API_KEY)
    json = JSON.parse(response.body)
    session[:token] = json['token']
    redirect '/home'
  end

  get '/home' do
    @token = session[:token]
    @recipient = session[:recipient]
    erb :home
  end

  get '/recipients/new' do
    erb :'/recipients/new'
  end

  post '/recipients' do
    @token = session[:token]
    @api = Api.new
    recipient_response = @api.add_recipient(params[:name], @token)
    json = JSON.parse(recipient_response.body)
    session[:recipient] = json['recipient']['name']
    redirect '/home'
  end

  run! if app_file == $0
end
