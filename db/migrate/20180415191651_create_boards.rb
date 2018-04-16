class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :position
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
