class RenameShopNameColumnToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :shop_name, :title
  end
end
