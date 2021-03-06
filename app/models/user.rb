class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

has_many :clients
has_many :schedules
has_many :gym_lists, through: :schedules
accepts_nested_attributes_for :clients
accepts_nested_attributes_for :schedules

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

def has_clients
  !clients.empty?
end

def has_schedules
  !schedules.empty?
end

scope :max_clients, -> {Client.group(:user_id).count(:id).sort_by {|k, v| v}.last}

end
