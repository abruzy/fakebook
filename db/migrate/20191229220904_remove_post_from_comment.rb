class RemovePostFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :posts_id, index: true, foreign_key: true
  end
end
