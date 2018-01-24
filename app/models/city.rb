class City < ApplicationRecord
	include CodeGenerator
  belongs_to :estado
end
