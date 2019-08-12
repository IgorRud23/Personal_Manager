class Schedule < ApplicationRecord

  validates :date_day, presence: true
  validates :date_day, inclusion: { in: %w[Mo Tu We Th Fr], message: '%{value} is not a valid day' }

  validates :date_time, presence: true

  validates :exercise_type, presence: true
  validates :exercise_type, inclusion: { in: %w[CrossFit Yoga Stretching Cycling Running], message: '%{value} is not a valid exercise type' }

  belongs_to :user
  belongs_to :gym_list
  belongs_to :client
  
end
