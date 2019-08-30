class InstrumentsController < ApplicationController

    get '/instruments' do
        @instruments = Instrument.all
        erb :'instruments/index'
    end


end