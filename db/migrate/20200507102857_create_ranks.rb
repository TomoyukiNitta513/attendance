class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.integer :user_id
      t.string :rank

      t.timestamps
    end
  end
end
