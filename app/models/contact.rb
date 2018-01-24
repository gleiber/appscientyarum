class Contact < ApplicationRecord
	include CodeGenerator
  belongs_to :postgraduate_coordination
  belongs_to :type_contact
end
