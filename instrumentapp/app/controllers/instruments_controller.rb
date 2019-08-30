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
        instrument = Instrument.create(params)
        redirect '/instruments'
    end

    get '/instruments/:id/edit' do
        @instrument = Instrument.find_by_id(params[:id])
        erb :'instruments/edit'
    end

    patch '/instruments/:id' do
        @instrument = Instrument.find_by_id(params[:id])
        @instrument.update(name: params[:instrument_name])
        redirect "/instruments/#{@instrument.id}"
    end

end