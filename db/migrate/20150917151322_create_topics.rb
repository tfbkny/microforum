class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.boolean :archived, default: false
      t.integer :votes, default: 0

      t.timestamps null: false
    end
  end
end
