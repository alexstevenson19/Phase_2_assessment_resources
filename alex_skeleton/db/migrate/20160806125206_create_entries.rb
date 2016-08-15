class CreateEntries < ActiveRecord::Migration
  def change
  	create_table :entries do |t|
  		t.string :title, { null: false }
  		t.string :content, { null: false }
  		t.integer :author_id
  		
  		t.timestamps(null: false)
  	end
  end
end
