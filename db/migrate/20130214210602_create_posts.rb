class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :link
      t.timestamp :pubdate
      t.text :description
      t.integer :blog_id
    end
  end
end
