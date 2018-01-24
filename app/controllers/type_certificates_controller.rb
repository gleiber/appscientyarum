class TypeCertificatesController < ApplicationController
  before_action :set_type_certificate, only: [:show, :edit, :update, :destroy]

  # GET /type_certificates
  # GET /type_certificates.json
  def index
    @type_certificates = TypeCertificate.all
  end

  # GET /type_certificates/1
  # GET /type_certificates/1.json
  def show
  end

  # GET /type_certificates/new
  def new
    @type_certificate = TypeCertificate.new
  end

  # GET /type_certificates/1/edit
  def edit
  end

  # POST /type_certificates
  # POST /type_certificates.json
  def create
    @type_certificate = TypeCertificate.new(type_certificate_params)

    respond_to do |format|
      if @type_certificate.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Constancias&tabla=Type_Certificate' }
        format.json { render :show, status: :created, location: @type_certificate }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Constancias&tabla=Type_Certificate' }
        format.json { render json: @type_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_certificates/1
  # PATCH/PUT /type_certificates/1.json
  def update
    respond_to do |format|
      if @type_certificate.update(type_certificate_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Constancias&tabla=Type_Certificate'  }
        format.json { render :show, status: :ok, location: @type_certificate }
      else
        format.html { render :edit }
        format.json { render json: @type_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_certificates/1
  # DELETE /type_certificates/1.json
  def destroy
    @type_certificate.destroy
    respond_to do |format|
      format.html { redirect_to type_certificates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_certificate
      @type_certificate = TypeCertificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_certificate_params
      params.require(:type_certificate).permit(:descripcion)
    end
end
