class AddColumnIsSaleToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :is_sale, :boolean
  end
end
