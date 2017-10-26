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
    redirect '/recipients'
  end

  get '/recipients' do
    @token = session[:token]
    @api = Api.new
    recipients_resp = @api.list_recipients(@token)
    json = JSON.parse(recipients_resp.body)
    @recipients = json['recipients']
    erb :'/recipients/index'
  end

  get '/payments' do
   @payment = session[:payment]
   erb :'/payments/index'
 end

  post '/payments' do
    @recipient_id = session[:id]
    @token = session[:token]
    @api = Api.new
    response = @api.send_payment(params[:amount], @recipient_id, @token)
    json = JSON.parse(response.body)
    session[:payment] = json['payment']['status']
    redirect '/payments'
  end

 get '/payments/new' do
   session[:id] = params[:id]
   erb :'/payments/new'
 end

  run! if app_file == $0
end
