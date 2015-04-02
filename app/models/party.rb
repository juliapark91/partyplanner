class Party < ActiveRecord::
  has_many :planned_parties
  has_many :guests, through: :planned_parties
end
