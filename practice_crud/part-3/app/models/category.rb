class Category < ActiveRecord::Base
	
	has_many :auctions
end
