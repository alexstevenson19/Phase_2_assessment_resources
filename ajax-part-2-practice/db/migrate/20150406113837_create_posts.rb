class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text   :body, null: false
      t.string :author_name, default: "anonymous"

      t.timestamps
    end
  end
end
