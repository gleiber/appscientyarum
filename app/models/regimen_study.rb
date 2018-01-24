class RegimenStudy < ApplicationRecord
	has_many :programs
	validates :descripcion, presence:  {case_sensitive: false}
end
