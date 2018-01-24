class TracingsController < ApplicationController
  before_action :set_tracing, only: [:show, :edit, :update, :destroy]

  # GET /tracings
  # GET /tracings.json
  def index
    @tracings = Tracing.all
  end

  # GET /tracings/1
  # GET /tracings/1.json
  def show
  end

  # GET /tracings/new
  def new
    @tracing = Tracing.new
  end

  # GET /tracings/1/edit
  def edit
  end

  def project_tracings

    project_id = params[:id]
    @tracings = Tracing.where(project_id: project_id)

    respond_to do |format|
      if @tracings 
        format.json { render json: @tracings, :status => :ok}
      else
        format.json { render json: @tracings, :status => :unprocessable_entity }
      end
    end
  end

  def thesis_tracings

    thesis_id = params[:id]
    @tracings = Tracing.where(thesis_id: thesis_id)

    respond_to do |format|
      if @tracings 
        format.json { render json: @tracings, :status => :ok}
      else
        format.json { render json: @tracings, :status => :unprocessable_entity }
      end
    end
  end

  # POST /tracings
  # POST /tracings.json
  def create
    @tracing = Tracing.new(tracing_params)

    respond_to do |format|
      if @tracing.save
        format.html { redirect_to @tracing}
        format.json { render action: 'show', status: :created, location: @tracing }
      else
        format.html { render action: 'new' }
        format.json { render json: @tracing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracings/1
  # PATCH/PUT /tracings/1.json
  def update
    respond_to do |format|
      if @tracing.update(tracing_params)
        format.html { redirect_to @tracing }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tracing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracings/1
  # DELETE /tracings/1.json
  def destroy
    @tracing.destroy
    respond_to do |format|
      format.html { redirect_to tracings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracing
      @tracing = Tracing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracing_params
      params.require(:tracing).permit(:project_id, :descripcion)
    end
end
