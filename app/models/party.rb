class Party < ActiveRecord::Base
  has_many :planned_parties, dependent: :destroy
  has_many :guests, through: :planned_parties, dependent: :destroy

  default_scope { order('started_at ASC') }
end
