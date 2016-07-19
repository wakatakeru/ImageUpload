class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :author_id
      t.text :path
      t.text :thumbnail_path
      t.binary :file
      t.binary :thumbnail_file
      t.timestamps null: false
    end
  end
end
