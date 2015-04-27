class User < ActiveRecord::Base
	
has_many :albums
has_many :reviews
end