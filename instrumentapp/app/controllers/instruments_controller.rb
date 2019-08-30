class InstrumentsController < ApplicationController

    get '/instruments' do
        @instruments = Instrument.all
        erb :'instruments/index'
    end

    get '/instruments/:id' do
        @Instrument = Instrument.find_by_id(params[:id])
        erb :'instruments/show'
    end


end