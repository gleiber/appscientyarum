class TypeContact < ApplicationRecord
	include CodeGenerator
	validates :descripcion, presence:  {case_sensitive: false}
	has_many :contacts
end
