class LineInvestigationsController < ApplicationController
  before_action :set_line_investigation, only: [:show, :edit, :update, :destroy]

  # GET /line_investigations
  # GET /line_investigations.json
  def index
    @line_investigations = LineInvestigation.all
    @program = Program.find(params[:id])
  end

  # GET /line_investigations/1
  # GET /line_investigations/1.json
  def show
  end
  def areas_lineas
    @line_investigations = LineInvestigation.all
    @line_investigation = LineInvestigation.new
  end

  def update_areas
    @line_investigation = LineInvestigation.find(params[:line_investigation_id])
    @area_interests = @line_investigation.area_interests
    respond_to do |format|
      format.js
    end
  end

  # GET /line_investigations/new
  def new
    if params[:program_id_line].present?
      @program = Program.find(params[:program_id_line])
      @line_investigation = LineInvestigation.new
    else
      redirect_to '/lineas_programa' , alert: 'Seleccione un programa' 
    end
  end

  # GET /line_investigations/1/edit
  def edit
    @program = @line_investigation.program
  end

  # POST /line_investigations
  # POST /line_investigations.json
  def create
    @line_investigation = LineInvestigation.new(line_investigation_params)

    respond_to do |format|
      if @line_investigation.save
        format.html { redirect_to "/lineas_programa", notice: "Linea creada exitosamente" }
        format.json { render action: 'show', status: :created, location: @line_investigation }
      else
        @program = @line_investigation.program
        format.html { render action: 'new' }
        format.json { render json: @line_investigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_investigations/1
  # PATCH/PUT /line_investigations/1.json
  def update
    respond_to do |format|
      if @line_investigation.update(line_investigation_params)
        format.html { redirect_to '/lineas_programa' , notice:"Modificacion exitosa." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_investigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_investigations/1
  # DELETE /line_investigations/1.json
  def destroy
    @line_investigation.destroy
    respond_to do |format|
      format.html { redirect_to line_investigations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_investigation
      @line_investigation = LineInvestigation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_investigation_params
      params.require(:line_investigation).permit(:descripcion, :program_id, :program_id_line, :line_investigation_id)
    end
end
