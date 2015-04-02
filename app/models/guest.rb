class Guest < ActiveRecord::Base
  has_many :planned_parties, dependent: :destroy
  has_many :parties, through: :planned_parties, dependent: :destroy
end
