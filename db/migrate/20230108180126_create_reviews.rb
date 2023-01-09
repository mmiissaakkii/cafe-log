class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :custmer_id
      t.integer :price
      t.string :store_name
      t.string :address
      t.string :body
      t.timestamps
    end
  end
end
