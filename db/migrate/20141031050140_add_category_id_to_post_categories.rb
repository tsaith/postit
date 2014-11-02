class AddCategoryIdToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :category_id, :integer
  end
end
