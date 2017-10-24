require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    'App running'
  end

  run! if app_file == $0
end
