class AddPostIdToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :post_id, :integer
  end
end
