class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :content, { null: false }
  		t.integer :entry_id
  		t.integer :author_id

  		t.timestamps(null: false)
  	end
  end
end
