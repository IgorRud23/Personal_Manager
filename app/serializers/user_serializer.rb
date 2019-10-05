class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :clients
  has_many :schedules 
end
