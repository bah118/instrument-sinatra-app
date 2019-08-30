class InstrumentsController < ApplicationController
    use Rack::Flash

    get '/instruments' do
        @instruments = Instrument.all
        erb :'instruments/index'
    end

    get '/instruments/new' do
        erb :'instruments/new'
    end
    
    get '/instruments/:id' do
        set_instrument
        erb :'instruments/show'
    end
    
    post '/instruments' do
        @instrument = Instrument.new(params[:instrument])
        if @instrument.save
            redirect '/instruments'
        else
            @errors = @instrument.errors.full_messages
            erb :'instruments/new'
        end
    end

    get '/instruments/:id/edit' do
        set_instrument
        erb :'instruments/edit'
    end

    patch '/instruments/:id' do
        set_instrument
        if @instrument.update(params[:instrument])
            redirect "/instruments/#{@instrument.id}"
        else
            @errors = @instrument.errors.full_messages
            erb :'instruments/edit'
        end
    end
    
    delete '/instruments/:id' do
        set_instrument
        @instrument.destroy
        redirect '/instruments'
    end

    private
        def set_instrument
            @instrument = Instrument.find_by_id(params[:id])
        end
end