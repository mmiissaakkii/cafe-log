class CreateReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tags do |t|
      t.integer :review_id
      t.integer :tag_id
      t.timestamps
      # 同じタグを２回保存出来ない

    end
  end
end
