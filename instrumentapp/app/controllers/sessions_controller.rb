class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

end
