class Schedule < ApplicationRecord

  validates :date_day, presence: true
  validates :date_day, presence: true

  validates :exercise_type, presence: true
  validates :exercise_type, inclusion: { in: %w[CrossFit Yoga Stretching Cycling Running], message: '%{value} is not a valid exercise type' }

  belongs_to :user
  belongs_to :gym_list
  belongs_to :client

def self.exercise_type
  %w[CrossFit Yoga Stretching Cycling Running]
end

end
