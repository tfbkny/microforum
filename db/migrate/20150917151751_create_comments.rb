class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.text :content
      t.integer :votes, default: 0
      t.references :comment, index: true #foreign_key: true removed as it would reference the ID in the Comments Table.

      t.timestamps null: false
    end
  end
end
