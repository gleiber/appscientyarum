class RequestClassLabsController < ApplicationController
  before_action :set_request_class_lab, only: [:show, :edit, :update, :destroy]

  # GET /request_class_labs
  # GET /request_class_labs.json
  def index
    @request_class_labs = RequestClassLab.all
  end

  # GET /request_class_labs/1
  # GET /request_class_labs/1.json
  def show
  end

  # GET /request_class_labs/new
  def new
    @request_class_lab = RequestClassLab.new
    @classroom_laboratories = ClassroomLaboratory.all
  end

  # GET /request_class_labs/1/edit
  def edit
  end
  
  def solicitud_tesis

    
  end

  # POST /request_class_labs
  # POST /request_class_labs.json
  def create
    @request_class_lab = RequestClassLab.new(request_class_lab_params)

  puts  @request_class_lab.to_json

 
    respond_to do |format|
     if (@request_class_lab.start >= DateTime.now)  and (@request_class_lab.start < @request_class_lab.end)
      if @request_class_lab.save


        format.html { redirect_to @request_class_lab, notice: 'Request class lab was successfully created.' }

         format.html { redirect_to @request_class_lab}

        format.json { render action: 'show', status: :created, location: @request_class_lab }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_class_lab.errors, status: :unprocessable_entity }
      end
    else
       flash[:notice] = "Fechas Invalidas"
    end
    end
  end

  # PATCH/PUT /request_class_labs/1
  # PATCH/PUT /request_class_labs/1.json
  def update
    respond_to do |format|
      if @request_class_lab.update(request_class_lab_params)
        format.html { redirect_to @request_class_lab }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_class_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_class_labs/1
  # DELETE /request_class_labs/1.json
  def destroy
    @request_class_lab.destroy
    respond_to do |format|
      format.html { redirect_to request_class_labs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_class_lab
      @request_class_lab = RequestClassLab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_class_lab_params
      params.require(:request_class_lab).permit(:user_id, :classroom_laboratory_schedule_id, :classroom_laboratory_id, :descripcion, :start, :end, :solicitante, :status)
    end
end
