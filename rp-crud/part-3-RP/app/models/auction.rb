class Auction < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :auctioner, class_name: :User
  has_many :bids
  has_many :bidders, through: :bids, source: :bidder

  validates :name, { presence: true }
  validates :description, { presence: true }
  validates :auctioner_id, { presence: true }
end

