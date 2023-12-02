class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :about
      t.string :cafe_name
      t.string :address

      t.timestamps
    end
  end
end
