class SessionsController < ApplicationController
    use Rack::Flash

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            flash[:notice] = "You are signed in!"
            redirect '/'
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
