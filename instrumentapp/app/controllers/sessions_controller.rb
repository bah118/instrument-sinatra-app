class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    get '/login' do
        erb :'sessions/login'
    end

end
