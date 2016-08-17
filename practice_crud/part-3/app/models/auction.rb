class Auction < ActiveRecord::Base

	belongs_to :category
	belongs_to :auctioner, class_name: :User
	has_many :bids
	has_many :bidders, through: :bids, source: :bidder
end
