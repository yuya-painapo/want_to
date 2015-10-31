class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :smid, null: false
      t.integer :start_vpos, null: false
      t.text :comment
      # t.text :tag
      t.timestamps null: false
    end
  end
end
