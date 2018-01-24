class OfferUser < ApplicationRecord
	include CodeGenerator
  belongs_to :offer
  belongs_to :user
end
