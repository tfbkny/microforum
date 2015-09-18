class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true #added , index: true, foreign_key: true which was missing due to a missing s in references when running scaffold. That also required to fix the controller which had a :topic instad of a :topic_id in the before_action :set_post and the .json view file

      t.text :content
      t.integer :votes, default: 0

      t.timestamps null: false
    end
  end
end
