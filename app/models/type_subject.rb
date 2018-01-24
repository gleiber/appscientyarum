class TypeSubject < ApplicationRecord
  has_many :subjects
  validates :descripcion, presence:  {case_sensitive: false,message: "No puede estar en blanco"} 

end
