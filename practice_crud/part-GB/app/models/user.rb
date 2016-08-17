require 'bcrypt'

class User < ActiveRecord::Base
	has_many :bids, foreign_key: :bidder_id
	has_many :auctions, foreign_key: :auctioner_id

	validates :username, { presence: true, uniqueness: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password, { presence: true }
  # validate :password_length

	include BCrypt
	def password
		@password ||= Password.new(hashed_password)
	end

	def password=(new_password)
		# @entered_password = new_password
		@password = Password.create(new_password)
		self.hashed_password = @password
	end

	def authenticate(input_password)
		self.password == input_password
	end

  # def password_length
  #   if @entered_password && @entered_password.length < 3
  #     self.errors.add(:password, "should be at least 3 characters, silly")
  #   end
  # end
end
