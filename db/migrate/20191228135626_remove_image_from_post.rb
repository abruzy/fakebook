class RemoveImageFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :image, :string
  end
end
