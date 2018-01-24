class RoleFuncionsController < ApplicationController
  before_action :set_role_funcion, only: [:show, :edit, :update, :destroy]

  # GET /role_funcions
  # GET /role_funcions.json
  def index
    @roles = Role.all
  end

  # GET /role_funcions/1
  # GET /role_funcions/1.json
  def show
  end

  # GET /role_funcions/new
  def new
    @role_funcion = RoleFuncion.new
    @roles = Role.all
    @funcions = Funcion.all
  end
  def guardar_asociacion
    role_id = Role.find(params[:role_id])
    funcions = params[:funcions].blan? 
    if params[:funcions].present? 
     funcions = params[:funcions]
        funcions.each do |funcion_id|
            hijo = Funcion.find(funcion_id)
            if hijo.id_padre != nil 
              padre = Funcion.find_by(id_funcion: hijo.id_padre)
              padre_registrado = RoleFuncion.find_by(role_id: role.id, funcion_id: padre.id)
            end
            if (hijo.id_padre == nil) or (padre_registrado != nil)
              RoleFuncion.create(role_id: role.id, funcion_id: funcion_id)
            else
              abuelo = Funcion.find_by(id_funcion: padre.id_padre)
              if abuelo != nil 
                abuelo_registrado = RoleFuncion.find_by(role_id: role.id, funcion_id: abuelo.id)
                if abuelo_registrado == nil
                  RoleFuncion.create(role_id: role.id, funcion_id: abuelo.id)
                end
              end
              RoleFuncion.create(role_id: role.id, funcion_id: padre.id)
              RoleFuncion.create(role_id: role.id, funcion_id: funcion_id)         
            end
        end
      end
      redirect_to role_funcions_url
  end

  def editar_asociacion
    @role = Role.find(params[:role_id]) 
    @funcions = Funcion.all    
    @role_funcion = RoleFuncion.new
    render "role_funcions/edit_role_funcions"
  end
  def actualizar_asociacion
    role = Role.find(params[:role_funcion][:role_id])
    role_funcions = role.role_funcion
    role_funcions.each do |rf|
      rf.destroy
    end
    if params[:funcions].present? 
      funcions = params[:funcions]
      funcions.each do |funcion_id|
          hijo = Funcion.find(funcion_id)
          if hijo.id_padre != nil 
            padre = Funcion.find_by(id_funcion: hijo.id_padre)
            padre_registrado = RoleFuncion.find_by(role_id: role.id, funcion_id: padre.id)
          end
          if (hijo.id_padre == nil) or (padre_registrado != nil)
            RoleFuncion.create(role_id: role.id, funcion_id: funcion_id)
          else
            abuelo = Funcion.find_by(id_funcion: padre.id_padre)
            if abuelo != nil 
              abuelo_registrado = RoleFuncion.find_by(role_id: role.id, funcion_id: abuelo.id)
              if abuelo_registrado == nil
                RoleFuncion.create(role_id: role.id, funcion_id: abuelo.id)
              end
            end
            RoleFuncion.create(role_id: role.id, funcion_id: padre.id)
            RoleFuncion.create(role_id: role.id, funcion_id: funcion_id)         
          end
      end
    end
    redirect_to role_funcions_url
  end
  # GET /role_funcions/1/edit
  def edit
  end

  # POST /role_funcions
  # POST /role_funcions.json
  def create
    @role_funcion = RoleFuncion.new(role_funcion_params)
    respond_to do |format|
      if @role_funcion.save
        format.html { redirect_to @role_funcion }
        format.json { render action: 'show', status: :created, location: @role_funcion }
      else
        format.html { render action: 'new' }
        format.json { render json: @role_funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_funcions/1
  # PATCH/PUT /role_funcions/1.json
  def update
    respond_to do |format|
      if @role_funcion.update(role_funcion_params)
        format.html { redirect_to @role_funcion }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role_funcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_funcions/1
  # DELETE /role_funcions/1.json
  def destroy
    @role_funcion.destroy
    respond_to do |format|
      format.html { redirect_to role_funcions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_funcion
      @role_funcion = RoleFuncion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_funcion_params
      params.require(:role_funcion).permit(:role_id, :funcion_id, :funcions)
    end
end