class User < ActiveRecord::Base
    has_many :instruments
end
