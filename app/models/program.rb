class Program < ActiveRecord::Base
  include CodeGenerator
     attr_accessor :avatar
     has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/   
  
  belongs_to :postgraduate_coordination
  belongs_to :modality
  belongs_to :regimen_study
  belongs_to :user
  has_many :postulates, through: :detail
  has_many :offers
  has_many :line_investigations
  has_many :program_subject
  has_many :subjects, through: :program_subject
  has_many :program_collection
  has_many :collections, through: :program_collection
  has_many :cohort_program
  has_many :cohorts, through: :cohort_program
  has_many :regimen_durations

  has_many :graduate_profiles # saul


  validates :titulo, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}, length: {minimum: 10 ,message: "del Programa no puede ser tan corto"}, uniqueness: {message: "Este nombre esta siendo usado para otro programa, por favor elija otro"} 

  validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :duracion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"},numericality: { only_integer: true, message: "debe ser en numero" }
  validates :grado_egresado, presence:  {case_sensitive: false ,message: "No puede estar en blanco"} 
  validates :regimen_study, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :modality, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  validates :user, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

  validates :avatar, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

  #validates :collections, presence: {case_sensitive: false ,message: "Debe seleccionar por lo menos uno"}

  #after_create :save_collections
  #after_update :update_collections, :save_collections



attr_reader :subjects



  

  def collections=(value)
    @collections = value
  end

  private
      

  def save_collections
    @collections.each do |collection_id|
      ProgramCollection.create(collection_id: collection_id, program_id: self.id )
    end
  end
  def update_collections
    @program_collections = ProgramCollection.find_by_sql "Select * From program_collections where program_id="+self.id.to_s+""
    @program_collections.each do |program_collection|
      program_collection.destroy
    end
  end
end