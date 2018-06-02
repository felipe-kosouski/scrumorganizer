class RemoveCollumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :manager
      t.remove :master
      t.remove :dev
    end
  end
end
