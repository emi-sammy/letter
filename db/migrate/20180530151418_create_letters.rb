class CreateLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :letters do |t|
      t.text :content
      t.timestamps
    end
  end
end
