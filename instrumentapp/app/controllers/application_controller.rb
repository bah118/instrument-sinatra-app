require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "supersecret"
  end

  use Rack::Flash

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      User.find_by_id(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end
    
    def redirect_if_not_signed_in
      redirect '/login' if !is_logged_in?
    end
    
  end
  
end
