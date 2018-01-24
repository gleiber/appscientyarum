class DefendingThesesController < ApplicationController
  before_action :set_defending_thesis, only: [:show, :edit, :update, :destroy]

  # GET /defending_theses
  # GET /defending_theses.json
  def index
    @theses = Thesis.all
    @defending_theses = DefendingThesis.all
     @defending_thesis = DefendingThesis.new
  end

  # GET /defending_theses/1
  # GET /defending_theses/1.json
  def show
   @thesis = @defending_thesis.thesis
    @defending_theses = DefendingThesis.all
  end
  # GET /defending_theses/new
  def new
    @theses = Thesis.all
    @thesis = Thesis.new
    @defending_thesis = DefendingThesis.new
    @thesis = Thesis.find params[:thesis_id]
  end

  # GET /defending_theses/1/edit
  def edit
    @defending_thesis.fecha = params[:fecha]
    @defending_thesis.hora = params[:hora]
  end

  def thesis_defense

    thesis_id = params[:id]
    @defending_theses = DefendingThesis.find_by(thesis_id: thesis_id)

    respond_to do |format|
      if @defending_theses 
        format.json { render json: @defending_theses, :status => :ok}
      else
        format.json { render json: @defending_theses, :status => :unprocessable_entity }
      end
    end
  end

  # POST /defending_theses
  # POST /defending_theses.json
  def create

    @defending_thesis= DefendingThesis.new(defending_thesis_params)
    @defending_thesis.fecha = params[:fecha]
    @defending_thesis.hora = params[:hora]

    respond_to do |format|
     
      if @defending_thesis.save
  Tracing.create(thesis_id: @defending_thesis.thesis_id, descripcion: "Defensa de Tesis/TEG Registrada")
        format.html { redirect_to @defending_thesis , notice: 'Defensa Asignada Exitosamente' }
        format.json { render action: 'show', status: :created, location: @defending_thesis }


       notific = Notification.create(tittle: "Se ha registrado una defensa para su tesis "+
                                         Thesis.find(@defending_thesis.thesis_id).titulo.to_s+"en la fecha: "+@defending_thesis.fecha.to_s+" en el salón "+@defending_thesis.lugar.to_s,
                                     event: "Se ha registrado una defensa para su tesis "+
                                         Thesis.find(@defending_thesis.thesis_id).titulo.to_s+"en la fecha: "+@defending_thesis.fecha.to_s+" en el salón "+@defending_thesis.lugar.to_s,
                                     viewed: FALSE,
                                     id_user: @defending_thesis.thesis.user.id,id_publisher: nil,
                                     url: $domain_url+"/notifications")

        publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                             notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)
        ThesisDefenseMailer.sample_email(@defending_thesis).deliver_now

         else
          @thesis = @defending_thesis.thesis
          @defending_thesis.fecha = params[:fecha]
          @defending_thesis.hora = params[:hora]

          format.html { redirect_to '/defending_theses/new?'+{thesis_id: @thesis.id}.to_param, alert: 'Debe Llenar todos los Campos'}
           format.json { render json: @defending_thesis.errors, status: :unprocessable_entity }

        end
       
    end
  end

  # PATCH/PUT /defending_theses/1
  # PATCH/PUT /defending_theses/1.json
  def update
    @defending_thesis.fecha = params[:fecha]
    @defending_thesis.hora = params[:hora]

    respond_to do |format|
      if @defending_thesis.update(defending_thesis_params)
        format.html { redirect_to @defending_thesis }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @defending_thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defending_theses/1
  # DELETE /defending_theses/1.json
  def destroy
    @defending_thesis.destroy
    respond_to do |format|
      format.html { redirect_to defending_theses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defending_thesis
      @defending_thesis = DefendingThesis.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def defending_thesis_params
      params.require(:defending_thesis).permit(:fecha, :hora, :lugar, :thesis_id)
    end

end
