class Client < ApplicationRecord

  validates :name, presence: true
  validates_length_of :name, minimum: 1, maximum: 30, allow_blank: true

  validates :gender, presence: true
  validates :gender, inclusion: { in: %w[Male Female], message: '%{value} is not a valid gender' }

  validates :age, presence: true
  validates :age, numericality: { greater_than: 7}

  validates :weight, presence: true
  validates :weight, numericality: { greater_than: 30}

  validates :height, presence: true
  validates :height, numericality: { greater_than: 30}

  belongs_to :user
  has_many :schedules, through: :user

  def self.allowed_genders
    %w[Male Female]
  end

#scope :order_by, ->(attr) { order("#{attr} DESC") } - sortye v alfavitnomy porydky

end
