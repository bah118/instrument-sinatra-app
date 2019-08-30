class InstrumentsController < ApplicationController
    use Rack::Flash

    get '/instruments' do
        redirect_if_not_signed_in
        @instruments = current_user.instruments
        erb :'instruments/index'
    end

    get '/instruments/new' do
        redirect_if_not_signed_in
        erb :'instruments/new'
    end
    
    get '/instruments/:id' do
        redirect_if_not_signed_in
        set_instrument
        erb :'instruments/show'
    end
    
    post '/instruments' do
        redirect_if_not_signed_in
        @instrument = current_user.instruments.build(params[:instrument])
        if @instrument.save
            redirect '/instruments'
        else
            @errors = @instrument.errors.full_messages
            erb :'instruments/new'
        end
    end

    get '/instruments/:id/edit' do
        redirect_if_not_signed_in
        set_instrument
        if @instrument.user == current_user
            erb :'instruments/edit'
        else
            flash[:notice] = "Unauthorized."
            redirect '/'
        end
    end





    patch '/instruments/:id' do
        redirect_if_not_signed_in
        set_instrument
        if @instrument.update(params[:instrument])
            redirect "/instruments/#{@instrument.id}"
        else
            @errors = @instrument.errors.full_messages
            erb :'instruments/edit'
        end
    end
    
    delete '/instruments/:id' do
        redirect_if_not_signed_in
        set_instrument
        @instrument.destroy
        redirect '/instruments'
    end

    private
        def set_instrument
            @instrument = Instrument.find_by_id(params[:id])
        end
end