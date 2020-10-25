class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.string :title, null: false
      t.integer :priority, null: false, default: 0

      t.timestamps
    end
  end
end
