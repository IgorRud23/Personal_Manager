class GymList < ApplicationRecord

  has_many :users, through: :schedules

  def gym_locations
    [
      {name: "gym_name", location: "gym_address" },
      {name: "gym_name", location: "gym_address" },
      {name: "gym_name", location: "gym_address" },
      {name: "gym_name", location: "gym_address" },
      ....
    ]
    #propisaty spisok do kincya
    #viklikaty za dopomogoyu GymList.gym_locations - poverne ves' spisok
    #GymList.gym_locations.[0] => {name: "gym_name...", location: "gym_address..." }
  end

end
