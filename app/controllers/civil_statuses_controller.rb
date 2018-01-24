class CivilStatusesController < ApplicationController
  before_action :set_civil_status, only: [:show, :edit, :update, :destroy]

  # GET /civil_statuses
  # GET /civil_statuses.json
  def index
    @civil_statuses = CivilStatus.all
  end

  # GET /civil_statuses/1
  # GET /civil_statuses/1.json
  def show
  end

  # GET /civil_statuses/new
  def new
    @civil_status = CivilStatus.new
  end

  # GET /civil_statuses/1/edit
  def edit
  end

  # POST /civil_statuses
  # POST /civil_statuses.json
  def create
    @civil_status = CivilStatus.new(civil_status_params)

    respond_to do |format|
      if @civil_status.save
        format.html { redirect_to '/maestricos/prueba?titulo=Estado+Civil&tabla=CivilStatus', notice: 'Estado Civil Registrado Exitosamente.' }
        format.json { render :show, status: :created, location: @civil_status }
      else
        format.html { render :new }
        format.json { render json: @civil_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /civil_statuses/1
  # PATCH/PUT /civil_statuses/1.json
  def update
    respond_to do |format|
      if @civil_status.update(civil_status_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Estado+Civil&tabla=CivilStatus', notice: 'Estado Civil Modificado Exitosamente.' }
        format.json { render :show, status: :ok, location: @civil_status }
      else
        format.html { redirect_to '/maestricos/edit?tabla=Estado&tabla_id='+@civil_status.id.to_s }
        format.json { render json: @civil_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /civil_statuses/1
  # DELETE /civil_statuses/1.json
  def destroy
    @civil_status.destroy
    respond_to do |format|
      format.html { redirect_to civil_statuses_url, notice: 'Civil status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_civil_status
      @civil_status = CivilStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def civil_status_params
      params.require(:civil_status).permit(:descripcion)
    end
end
