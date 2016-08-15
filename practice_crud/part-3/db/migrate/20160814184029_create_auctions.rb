class CreateAuctions < ActiveRecord::Migration
  def change
  	create_table :auctions do |t|
  		t.string :item, { null: false }
  		t.string :description, { null: false }
  		t.integer :category_id
  		t.integer :auctioner_id
  		
  		t.timestamps(null: false)
  	end  	
  end
end
