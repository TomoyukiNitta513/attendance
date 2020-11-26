class Detail < ApplicationRecord
  validates :user_id, presence: true
  validates :registration_date, presence: true
  belongs_to :user
end
