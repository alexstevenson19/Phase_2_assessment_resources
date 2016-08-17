class Bid < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :bidder, class_name: :User
  belongs_to :auction

  validates :amount, { presence: true }
  validates :bidder_id, { presence: true }
  validates :auction_id, { presence: true }
end
