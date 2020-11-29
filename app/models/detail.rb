class Detail < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :registration_date, presence: true, uniqueness: {scope: :user_id}
end
