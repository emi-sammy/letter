class AddImageToUsersLetters < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :text
    add_column :letters, :image, :text
  end
end
