class ProgramCalificationsController < ApplicationController
  before_action :set_program_calification, only: [:show, :edit, :update, :destroy]

  # GET /program_califications
  # GET /program_califications.json
  def index
    @program_califications = ProgramCalification.all
  end

  # GET /program_califications/1
  # GET /program_califications/1.json
  def show
  end

  # GET /program_califications/new
  def new
    @program_calification = ProgramCalification.new
  end

  # GET /program_califications/1/edit
  def edit
  end

  def calificar_programa
    @program_calification = ProgramCalification.find(params[:id])
  end

  # POST /program_califications
  # POST /program_califications.json
  def create
    @program_calification = ProgramCalification.new(program_calification_params)
    respond_to do |format|
      if @program_calification.save
        format.html { redirect_to @program_calification, notice: '¡Gracias por calificar el programa!' }
        format.json { render :show, status: :created, location: @program_calification }
      else
        format.html { render :new }
        format.json { render json: @program_calification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_califications/1
  # PATCH/PUT /program_califications/1.json
  def update
    respond_to do |format|
      if  ProgramCalification.update(params[:id].to_i, :comment => params[:program_calification][:comment], :calification => params[:calification].to_i)#@program_calification.update(program_calification_params)
        format.html { redirect_to @program_calification, notice: 'Program calification was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_calification }
      else
        format.html { render :edit }
        format.json { render json: @program_calification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_califications/1
  # DELETE /program_califications/1.json
  def destroy
    @program_calification.destroy
    respond_to do |format|
      format.html { redirect_to program_califications_url, notice: 'Program calification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_calification
      @program_calification = ProgramCalification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_calification_params
      params.require(:program_calification).permit(:id_user, :id_program, :comment, :calification)
    end
end
