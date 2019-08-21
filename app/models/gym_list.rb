class GymList < ApplicationRecord

  has_many :users, through: :schedules

end
