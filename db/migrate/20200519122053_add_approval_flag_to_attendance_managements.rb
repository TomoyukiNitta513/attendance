class AddApprovalFlagToAttendanceManagements < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_managements, :approval_flag, :boolean, default: false
  end
end
