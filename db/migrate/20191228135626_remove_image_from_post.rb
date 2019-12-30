class RemoveImageFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :image

  end
end
