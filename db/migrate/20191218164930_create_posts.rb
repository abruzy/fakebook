class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :description
      t.string :image
      t.references :user, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
