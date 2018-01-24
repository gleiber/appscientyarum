class Role < ActiveRecord::Base
  include CodeGenerator
	has_many :role_funcion
	has_many :funcions, through: :role_funcion
	has_many :type_poll_roles
  has_many :users
  validates :descripcion, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}


 #after_create :save_funcion 

 #after_update :update_funcion, :save_funcion 

  def funcions=(value)
    @funcions = value
  end
  
  private
  
  def save_funcion
    @funcions.each do |funcion_id|
      RoleFuncion.create(role_id: self.id, funcion_id: funcion_id)
    end
  end
  def update_funcion
    @role_funcions = RoleFuncion.find_by_sql "Select * From role_funcions where role_id="+self.id.to_s+""
    @role_funcions.each do |role_funcion|
      role_funcion.destroy
    end
  end


end
