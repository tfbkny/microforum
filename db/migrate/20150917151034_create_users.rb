class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :votes, default: 0
      t.boolean :is_admin, default: false
      t.boolean :is_moderator, defaul: false
      t.boolean :active, default: true
      t.timestamp :last_login
      t.timestamp :last_logout

      t.timestamps null: false
    end
  end
end
