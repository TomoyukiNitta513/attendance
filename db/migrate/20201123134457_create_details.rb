class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :user_id
      t.date :registration_date
      t.integer :carfare
      t.integer :income_tax

      t.timestamps
    end
  end
end
