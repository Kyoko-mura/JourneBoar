class ChangePostImagesToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_table :post_images, :posts
  end
end
