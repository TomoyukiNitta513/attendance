class AttendanceManagement < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :attendance_date, presence: true, uniqueness: true

end
