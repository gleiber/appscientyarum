class Offer < ActiveRecord::Base
	include CodeGenerator
  belongs_to :program
  has_many :postulates
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  
  validates :titulo, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}, length: {minimum: 10 ,message: "de la oferta no puede ser tan corto"}, uniqueness: {message: "Este nombre esta siendo usado para otra oferta, por favor elija otro"} 
  #validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}, length: {minimum: 20 ,message: "de la oferta no puede ser tan corta"}
  #validates :fecha_final, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :fecha_desde, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
  #validates_date :fecha_desde, invalid_date: "Fecha invalidad"
  validates :fecha_hasta, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :fecha_inscripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :program_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :avatar, presence: {case_sensitive: false ,message:"Debe escoger una imagen"}
end
