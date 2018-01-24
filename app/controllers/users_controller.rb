class UsersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :edit, :eliminar]

  def current_user_json
    @user = User.where(:id => current_user.id)
    respond_to do |format|
      format.json { render :json => @user }
    end
  end

  def index
    @users = User.order('created_at').all
    @roles = Role.all
  end

  def show

  end

  def chequeo_ficha
    @user = User.find(params[:user])
    @collections = @user.cohort_program.program.collections
    render "postulates/chequeo_ficha"
  end

  def edit
    @user = User.find(params[:id])
    @line_investigations = LineInvestigation.all
    @area_interests = @user.area_interests
    @academic_degree = AcademicDegree.all
    @specialities    = Speciality.all 
    @ownerships =  @user.ownerships
    @roles = Role.all
    @sexos = Sex.all
    @civil_status = CivilStatus.all
  end

  def form_edit

   @user = User.find(params[:user_id])
   @roles = Role.all

 end

 def area_interest
  @user = User.find(current_user.id)
  @area_interests = AreaInterest.where(line_investigation_id: current_user.line_investigation.id)
end

def titulos_academicos

  @user = User.find(current_user.id)
  @academic_degrees = AcademicDegree.all
  @specialities    = Speciality.all
  @ownerships = Ownership.all 


end

def guardar_titulos_academicos

  @user = User.find(current_user.id)

    #@academic_degrees = params[:academic_degrees]
    #@specialities = params[:specialities]


    @ownerships  = params[:ownerships]

    @ownerships_users = @user.user_ownership

    @ownerships_users.each do |ownership_user|

      ownership_user.destroy

    end   

    @ownerships.each do |ownership_id|
      UserOwnership.create(user_id: @user.id, ownership_id: ownership_id)


    end
    redirect_to  edit_user_path(current_user) 
  end 

  def guardar_area_interest
    @user = User.find(current_user.id)
    @area_interests = params[:area_interests]
    @areas_users = @user.user_area_interest
    @areas_users.each do |areas_user|
      areas_user.destroy
    end
    @area_interests.each do |area_interest_id|
      UserAreaInterest.create(user_id: @user.id, area_interest_id: area_interest_id)
    end
    redirect_to edit_user_path(current_user) 
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

  def delete

    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/users', notice: 'Usuario Eliminado con Exito' }
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
    @roles = Role.all

    respond_to do |format|
      if @user.save
        if current_user
          format.html { redirect_to users_path, notice: 'Usuario Registrado con Exito' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { redirect_to '/users', notice: 'Usuario Registrado con Exito' }
          format.json { render :index, status: :created, location: @user}
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
    def update
    #puts params[:user_id]

    respond_to do |format| 
      puts "params"
      params[:decision]
      if params[:decision].present?

        if @user.update(password: user_params[:password],nombre: user_params[:nombre],role_id: params[:role_id])
          format.html { redirect_to users_path , notice: 'usuario actualizado'  }
          format.json { head :no_content }
        else
         @roles = Role.all
         format.html { render edit_user_path(current_user) }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     else

      if user_params[:avatar].present? 

        puts "aqui se cambia"
        if @user.update(password: user_params[:password],email: user_params[:email],username: user_params[:username], nombre: user_params[:nombre],cedula: user_params[:cedula], direccion: user_params[:direccion] , email: user_params[:email],username: user_params[:username] ,sex_id: user_params[:sex_id], telefono: user_params[:telefono] , fecha_nacimiento: user_params[:fecha_nacimiento],civil_status_id: params[:civil_status_id],avatar: user_params[:avatar], line_investigation_id: params[:line_investigation_id])
          sign_in(@user, :bypass => true)
          format.html { redirect_to edit_user_path(current_user)  }
          format.json { head :no_content }
        else
          @roles = Role.all
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end

      else
        puts "aqui se mantiene"        
        if @user.update(password: user_params[:password],email: user_params[:email],username: user_params[:username], nombre: user_params[:nombre],cedula: user_params[:cedula], direccion: user_params[:direccion] , email: user_params[:email],username: user_params[:username] ,sex_id: user_params[:sex_id], telefono: user_params[:telefono] , fecha_nacimiento: user_params[:fecha_nacimiento],civil_status_id: params[:civil_status_id], line_investigation_id: params[:line_investigation_id])
          sign_in(@user, :bypass => true)
          format.html { redirect_to root_path }
          format.json { head :no_content }
        else
          @roles = Role.all
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end


    end
       #@user.desicion = params[:desicion]
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
     params.require(:user).permit(:user_id,:password, :role_id, :email, :username, :user_area_interest_area_interest_id,:nombre,:cedula,:direccion,:sex_id,:telefono,:fecha_nacimiento,:civil_status_id,:avatar,:line_investigation_id, :decision)
   end
 end


