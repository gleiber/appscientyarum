class TypeRequestsController < ApplicationController
  before_action :set_type_request, only: [:show, :edit, :update, :destroy]

  # GET /type_requests
  # GET /type_requests.json
  def index
    @type_requests = TypeRequest.all
  end

  # GET /type_requests/1
  # GET /type_requests/1.json
  def show
  end

  # GET /type_requests/new
  def new
    @type_request = TypeRequest.new
  end

  # GET /type_requests/1/edit
  def edit
  end

  # POST /type_requests
  # POST /type_requests.json
  def create
    @type_request = TypeRequest.new(type_request_params)

    respond_to do |format|
      if @type_request.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Solicitud&tabla=TypeRequest'}
        format.json { render action: 'show', status: :created, location: @type_request }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Solicitud&tabla=TypeRequest' }
        format.json { render json: @type_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_requests/1
  # PATCH/PUT /type_requests/1.json
  def update
    respond_to do |format|
      if @type_request.update(type_request_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Solicitud&tabla=TypeRequest' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_requests/1
  # DELETE /type_requests/1.json
  def destroy
    @type_request.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Solicitud&tabla=TypeRequest' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_request
      @type_request = TypeRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_request_params
      params.require(:type_request).permit(:descripcion)
    end
end
