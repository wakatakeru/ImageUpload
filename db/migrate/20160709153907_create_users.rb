class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_id
      t.string :email
      t.string :password_digest, null: false
      t.text :bio
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
