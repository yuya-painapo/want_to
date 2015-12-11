class DropTableCacheflvinfos < ActiveRecord::Migration
  def change
	  drop_table :cacheflvinfos
  end
end
