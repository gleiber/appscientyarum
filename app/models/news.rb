class News < ActiveRecord::Base
	include CodeGenerator
	 attr_accessor :avatar
		 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/   
	belongs_to :tracing
	belongs_to :type_new
validates :titulo, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
end