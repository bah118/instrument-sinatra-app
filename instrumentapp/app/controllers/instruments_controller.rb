class InstrumentsController < ApplicationController

    get '/instruments' do
        @instruments = Instrument.all
        erb :'instruments/index'
    end

    get '/instruments/new' do
        erb :'instruments/new'
    end
    
    get '/instruments/:id' do
        @instrument = Instrument.find_by_id(params[:id])
        erb :'instruments/show'
    end
    
    post '/instruments' do
        # @instruments = Instrument.all
        @instrument = Instrument.create(name: params[:instrument_name])
        redirect '/instruments'
    end

end