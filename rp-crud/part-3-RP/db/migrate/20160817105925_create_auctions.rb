class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name, { null: false }
      t.string :condition
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :description, { null: false }
      t.integer :auctioner_id, { null: false }

      t.timestamps(null: false)
    end
  end
end
