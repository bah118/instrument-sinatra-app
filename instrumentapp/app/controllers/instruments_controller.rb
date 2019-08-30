class InstrumentsController < ApplicationController

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
        instrument = Instrument.create(params[:instrument])
        redirect '/instruments'
    end

    get '/instruments/:id/edit' do
        set_instrument
        erb :'instruments/edit'
    end

    patch '/instruments/:id' do
        set_instrument
        @instrument.update(params[:instrument])
        redirect "/instruments/#{@instrument.id}"
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