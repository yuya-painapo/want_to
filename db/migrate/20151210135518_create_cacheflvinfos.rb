class CreateCacheflvinfos < ActiveRecord::Migration
  def change
    create_table :cacheflvinfos do |t|
      t.string :smid, null: false
      t.text :flvinfo, null: false

      t.timestamps null: false
    end
  end
end
