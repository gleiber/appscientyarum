class SubPerUser < ApplicationRecord
  belongs_to :user
  belongs_to :coh_per_sub_us
end
