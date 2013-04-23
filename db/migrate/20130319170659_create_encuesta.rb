class CreateEncuesta < ActiveRecord::Migration
  def change
    create_table :encuesta do |t|
      t.integer :puntuacion
      t.text :comentario

      t.timestamps
    end
  end
end
