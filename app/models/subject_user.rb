class SubjectUser < ActiveRecord::Base
	include CodeGenerator
  belongs_to :subject
  belongs_to :user
  has_one :coh_per_sub_u, :dependent => :destroy
end
