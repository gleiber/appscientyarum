class Interested < ApplicationRecord
  belongs_to :program
  belongs_to :area_interest
  belongs_to :detail
  belongs_to :find_out
  belongs_to :why_dcyt
end
