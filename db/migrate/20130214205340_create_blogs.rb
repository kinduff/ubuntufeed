class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :slug
      t.string :url
      t.string :feed_url
      t.text :description
      t.boolean :visible, :default => false
    end
  end
end
