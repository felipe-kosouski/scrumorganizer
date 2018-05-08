class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.references :board, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
