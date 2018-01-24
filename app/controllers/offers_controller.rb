class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
    #@offers =  current_user.program.offer
    #exec "backup perform --trigger my_backup"
    #exec "whenever"
    #docker exec "rake db:backup"
  end
  def asigancion_recursos
    @offers = Offer.all
    @programs = Program.all
    @cohorts = Cohort.all
    render 'offers/asignacion_recursos'
  end
  def recursos_cohorte
    @programs = Program.all
    @cohorts = Cohort.all
    render 'offers/recursos_cohorte'
  end
  def regimen
    @programs = Program.all
    @cohorts = Cohort.all
    render 'offers/regimen'
  end
  def recursos_oferta
    @offer = Offer.new
    @offers = Offer.all
  end
  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @programs = Program.all
  end

  # GET /offers/1/edit
  def edit
    @programs = Program.all
  end

  # POST /offers 
  # POST /offers.json
  def create

    @offer = Offer.new(offer_params)
    @offer.program_id = params["id_program"]
    @offer.fecha_desde = params[:fecha_desde]
    @offer.fecha_hasta = params[:fecha_hasta]
    respond_to do |format|
    if params[:fecha_desde].present? or params[:fecha_hasta].present?
      if (@offer.fecha_desde >= DateTime.now)  and (@offer.fecha_desde < @offer.fecha_hasta)
          if @offer.save
            News.create(titulo: @offer.titulo, descripcion: "Apertura de la Oferta sobre el programa "+@offer.program.titulo, avatar: @offer.avatar)
            @interesados = Interested.where(:program_id => @offer.program_id)
            if !@interesados.nil?
              @interesados.each do |interesado|
                OfferMailer.sample_email(interesado,Program.find(@offer.program_id).titulo).deliver_now
              end 

            end
            format.html { redirect_to offers_path, notice:"Oferta creada exitosamente."}
            format.json { render action: 'show', status: :created, location: @offer }
          else
            @programs = Program.all
            format.html { render action: 'new' }
            format.json { render json: @offer.errors, status: :unprocessable_entity }
          end
      else
        @programs = Program.all
        format.html { render action: 'new', alert: 'La fecha de inicio debe ser menor a la fecha final' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    else
      format.html { redirect_to new_offer_path, notice: 'Seleccione una fecha'}
    end
  end

  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offers_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:titulo, :fecha_desde, :fecha_hasta, :program_id, :avatar)
    end
end
