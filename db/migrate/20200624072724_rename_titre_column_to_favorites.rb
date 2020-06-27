class RenameTitreColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :post_image_id, :post_id
  end
end
