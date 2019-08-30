class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save

        else
            @errors = user.errors.full_messages
            erb :'sessions/signup'
        end
    end

    get '/login' do
        erb :'sessions/login'
    end

    get '/logout' do
        redirect '/'
    end
    

end
