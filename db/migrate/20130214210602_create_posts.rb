class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.string :comments
      t.timestamp :pubdate
      t.text :description
    end
  end
end
