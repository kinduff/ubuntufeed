class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :log_type
      t.integer :new_posts

      t.timestamps
    end
  end
end
