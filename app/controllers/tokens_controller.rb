class TokensController < ApplicationController
  


  before_action :set_user, only: [:show, :update, :edit, :eliminar]
  
  def index
    rol = Role.find_by(descripcion: 'Participante')
    @users = rol.users
  end
  def show
    
  end

  def edit

      @user = User.find(params[:id])
      @line_investigations = LineInvestigation.all
      @area_interests = @user.area_interests
      @program = @user.cohort_program.program
      @roles = Role.all
      @ownerships =  @user.ownerships
      @academic_degree = AcademicDegree.all
      @subjects = Array.new
      @sub_per_users = SubPerUser.where(user_id: @user.id)
      @sub_per_users.each do |sub_per_user|
        coh_per_sub_u = CohPerSubU.find(sub_per_user.coh_per_sub_u_id)
        subject_user = SubjectUser.find(coh_per_sub_u.subject_user_id)
        subject = Subject.find(subject_user.subject_id)
        @subjects.push subject.descripcion
      end
      @speciality = Speciality.all
      @collectionsu = @program.collections
   
    @collections = Collection.all





  end
  def area_interest
    @user = User.find(1)
    @area_interests = AreaInterest.all
  end
  def guardar_area_interest
    @user = User.find(1)
    @area_interests = params[:area_interests]
    @areas_users = @user.user_area_interest
    @areas_users.each do |areas_user|
      areas_user.destroy
    end
    @area_interests.each do |area_interest_id|
      UserAreaInterest.create(user_id: @user.id, area_interest_id: area_interest_id)
    end
    redirect_to '/users'
  end
  def login_movil
    username = params[:username]
    @password = params[:password]
    @user = User.find_by(username: username)

    respond_to do |format|
      if @user 
        if @user.valid_password?(@password)
          format.json { render json: @user, :status => :ok}
        else
          format.json { render json: @user, :status => :unprocessable_entity }
        end
      else
        format.json { render json: @user, :status => :unprocessable_entity }
      end
    end
  end
  
  def pool_tutor
    area_interes = AreaInterest.find(params[:user_area_interest][:area_interest_id])
    @users = area_interes.users    
    #render "users/pool_tutor"
  end
  
  def pool
    @user = UserAreaInterest.new
    @users = User.all 
    @users_roles = User.all.find_by role_id: "1"
    @line_investigations = LineInvestigation.all
    render 'users/pools'
  end
  
  def eliminar
    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/users', notice: 'Usuario eliminado' }
      format.json { head :no_content }
    end
  end

  def new
    @user = User.new
    @roles = Role.all
  end

  def create
    @user = User.new(user_params)
    @user.role_id = params[:role_id]
    respond_to do |format|
      if @user.save
        if current_user
          format.html { redirect_to users_path, notice: 'Usuario Registrado con Exito' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { redirect_to '/users', notice: 'Paciente Registrado con Exito' }
          format.json { render :index, status: :created, location: @user}
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def update



         #@user.username          = params[:username]
         #@user.email             = params[:email]  
         #@user.nombre            = params[:nombre] 
         #@user.cedula            = params[:cedula] 
         #@user.direccion         = params[:direccion]
         #@user.sexo              = params[:sexo] 
         #@user.telefono          = params[:telefono] 
         #@user.fecha_nacimiento  = params[:fecha_nacimiento]
         #@user.estado_civil      = params[:estado_civil]
         @user.role_id           = params[:role_id]
         #@user.avatar            = params[:avatar]

            respond_to do |format|

      

      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'perfil  actualizado.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    def validate_user
        if current_user.rol=='1'
          #render '/sistemas/index'
        else
          redirect_to '/systems/index', notice: 'No tienes permisos para acceder a la pagina anterior'
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :role_id, :email, :username, :user_area_interest_area_interest_id,:nombre,:cedula,:direccion,:sexo,:telefono,:fecha_nacimiento,:estado_civil,:avatar)
    end
end
