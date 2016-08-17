class CreateBids < ActiveRecord::Migration
  def change
  	create_table :bids do |t|
  		t.decimal :amount, { null: false }
  		t.integer :auction_id
  		t.integer :bidder_id
  		
  		t.timestamps(null: false)
  	end   	
  end
end
