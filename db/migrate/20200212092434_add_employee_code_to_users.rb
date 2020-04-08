class AddEmployeeCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employee_code, :string
    add_column :users, :section, :string
    add_column :users, :resignation_flag, :boolean, default: false
    add_column :users, :resignation_at_date, :datetime
  end
end
