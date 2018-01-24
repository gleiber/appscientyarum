class Certificate < ApplicationRecord
  belongs_to :type_certificate
  belongs_to :type_status_certificate
  belongs_to :user

  validates :type_certificate_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :type_status_certificate_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end
