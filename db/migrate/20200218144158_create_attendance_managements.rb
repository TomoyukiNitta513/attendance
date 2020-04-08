class CreateAttendanceManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_managements do |t|
      t.references :user, foreign_key: true
      t.date :attendance_date
      t.time :sch_attendance
      t.time :sch_leaving
      t.time :res_attendance
      t.time :res_break_in
      t.time :res_break_out
      t.time :res_leaving
      t.boolean :delete_flag, default: false

      t.timestamps
    end
  end
end
