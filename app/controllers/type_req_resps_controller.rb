class TypeReqRespsController < ApplicationController
  before_action :set_type_req_resp, only: [:show, :edit, :update, :destroy]

  # GET /type_req_resps
  # GET /type_req_resps.json
  def index
    @type_req_resps = TypeReqResp.all
  end

  # GET /type_req_resps/1
  # GET /type_req_resps/1.json
  def show
  end

  # GET /type_req_resps/new
  def new
    @type_req_resp = TypeReqResp.new
  end

  # GET /type_req_resps/1/edit
  def edit
  end

  # POST /type_req_resps
  # POST /type_req_resps.json
  def create
    @type_req_resp = TypeReqResp.new(type_req_resp_params)

    respond_to do |format|
      if @type_req_resp.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Respuesta+de+Solicitud&tabla=TypeReqResps' }
        format.json { render action: 'show', status: :created, location: @type_req_resp }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Respuesta+de+Solicitud&tabla=TypeReqResps' }
        format.json { render json: @type_req_resp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_req_resps/1
  # PATCH/PUT /type_req_resps/1.json
  def update
    respond_to do |format|
      if @type_req_resp.update(type_req_resp_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Respuesta+de+Solicitud&tabla=TypeReqResps' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_req_resp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_req_resps/1
  # DELETE /type_req_resps/1.json
  def destroy
    @type_req_resp.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Respuesta+de+Solicitud&tabla=TypeReqResps' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_req_resp
      @type_req_resp = TypeReqResp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_req_resp_params
      params.require(:type_req_resp).permit(:descripcion)
    end
end
