class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :weight, :height
  has_many :schedules 
  belongs_to :user
end
