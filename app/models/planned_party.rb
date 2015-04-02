class PlannedParty < ActiveRecord::Base
  belongs_to :party
  belongs_to :guest
end
