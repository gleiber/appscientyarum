class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:edit, :update, :destroy]

  # GET /certificates
  # GET /certificates.json
  def index
    @certificates_temp = Certificate.order('updated_at').all
    if current_user.role_id == 6 or current_user.role.descripcion == "Participante"
      @certificates = @certificates_temp.where(user_id: current_user.id)
    else
      @type_certificates = TypeCertificate.all
      @type_status_certificates = TypeStatusCertificate.all
      render 'certificates/index_other'
    end
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      if params[:id].to_s == "study_certificate"
        format.pdf {render template: 'certificates/constancia_estudio', pdf: 'Constancia de Estudio'}
      else
        format.pdf {render template: 'certificates/approved_project_certificate', pdf: 'constancia_proyecto_aprobado'}
      end

    end
  end

  # GET /certificates/new
  def new
    @certificate = Certificate.new
    @type_certificates = TypeCertificate.all
  end

  # GET /certificates/1/edit
  def edit   
    @type_status_certificates = TypeStatusCertificate.all
  end

  # POST /certificates
  # POST /certificates.json
  def create
    @certificate = Certificate.new
    @certificate.user_id = current_user.id
    @certificate.type_certificate_id = params[:type_certificate_id]
    @certificate.type_status_certificate_id = "1"
    respond_to do |format|
      if @certificate.save
        format.html { redirect_to certificates_path }
        format.json { render :show, status: :created, location: @certificate }
      else
        @type_certificates = TypeCertificate.all
        format.html { render :new }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1
  # PATCH/PUT /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(type_status_certificate_id: params[:type_status_certificate_id])
        if @certificate.type_status_certificate_id == 3
          #Notifico de que en caso de estar lista que lo vaya a buscar
          ReadyCertificateMailer.sample_email(@certificate).deliver_now
        end      
          notific = Notification.create(tittle: "Su "+TypeCertificate.find(@certificate.type_certificate.id).descripcion+" se encuentra en estado: '"+TypeStatusCertificate.find(@certificate.type_status_certificate.id).descripcion+"'",
                                        event: "Su "+TypeCertificate.find(@certificate.type_certificate.id).descripcion.to_s+" se encuentra lista para ser retirada en nuestras instalaciones",
                                        viewed: FALSE,
                                        id_user: @certificate.user.id,
                                        url: $domain_url+"/notifications")
          publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                                notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)



        format.html { redirect_to certificates_path}
        format.json { render :show, status: :ok, location: @certificate }
      else
        @type_status_certificates = TypeStatusCertificate.all
        format.html { render :edit }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_certificates
    user_id = params[:id]
    @certificates = Certificate.where(user_id: user_id)

    respond_to do |format|
      if @certificates 
        format.json { render json: @certificates, :status => :ok}
      else
        format.json { render json: @sub_per_users, :status => :unprocessable_entity }
      end
    end
  end

      def get_type_status_certificate
      type_status_certificate_id = params[:id]
      @type_status_certificate = TypeStatusCertificate.find(type_status_certificate_id)

      respond_to do |format|
        if @type_status_certificate 
          format.json { render json: @type_status_certificate, :status => :ok}
        else
          format.json { render json: @type_status_certificate, :status => :unprocessable_entity }
        end
      end
    end


  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate.destroy
    respond_to do |format|
      format.html { redirect_to certificates_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate

      begin
        @certificate = Certificate.find(params[:id])
      rescue => ex
        @certificate = Certificate.find(current_user.id)
      end

    end
  def approved_project_certificate
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'certificates/approved_project_certificate', pdf: 'constancia_proyecto_aprobado'}
    end
  end

    def study_certificate
      respond_to do |format|
        format.html
        format.json
        format.pdf {render template: 'certificates/constancia_estudio', pdf: 'constancia_estudio'}
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_params
      params.require(:certificate).permit(:user_id, :type_certificate_id, :type_status_certificate_id )
    end
end
