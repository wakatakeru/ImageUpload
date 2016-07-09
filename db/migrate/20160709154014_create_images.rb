class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :author_id
      t.datetime :date
      t.text :path

      t.timestamps null: false
    end
  end
end
