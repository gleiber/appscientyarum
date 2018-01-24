class PostulatesController < ApplicationController
  before_action :set_postulate, only: [:edit, :update, :destroy]


  # GET /postulates
  # GET /postulates.json
  def index
    if current_user.role.id == 1 or current_user.role.descripcion == "Coordinador General"
      @postulates = Postulate.all
    end
    if current_user.role.id == 2 or current_user.role.descripcion == "Coordinador de Programa"
      @postulates =  current_user.program.offers.first.postulates
    end
  end

  # GET /postulates/1
  # GET /postulates/1.json
  def show
    @postulate = Postulate.find(params[:postulate])
    render 'postulate/show'
  end
  def chequeo
    @postulate = Postulate.find(params[:postulate])
    @collections = @postulate.offer.program.collections
    render "postulates/chequeo"
  end
  def admision
    @postulate = Postulate.find(params[:postulate])
    render "postulates/admision"
  end
  def mod
  end

  # GET /postulates/new
  def new
    @postulate = Postulate.new
  end

  # GET /postulates/1/edit
  def edit

  end



def reporte_postulados_pordia
  @postuladosdias= Postulate.all
  
end




  # POST /postulates
  # POST /postulates.json
  def create
    @postulate = Postulate.new(postulate_params)
    respond_to do |format|
      if @postulate.save
        #Notificamos que su postulacion ha sido registrado:
        NewPostulationMailer.sample_email(@postulate).deliver_now
        format.html { redirect_to @postulate }
        format.json { render action: 'show', status: :created, location: @postulate }
      else
        format.html { render action: 'new' }
        format.json { render json: @postulate.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /postulates/1
  # PATCH/PUT /postulates/1.json
  def update
    respond_to do |format|
      if(params[:d])
        if params[:decision]!=""
          @postulate.decision = params[:decision]
        else
          format.html { render '/postulates/admision', alert: 'Debe Seleccionar una Desición' }
        end
      else
        @collections= params[:collections]
        if (@collections)
          @postulate_collections = PostulateCollection.find_by_sql "Select * From postulate_collections where postulate_id="+@postulate.id.to_s+""
          @postulate_collections.each do |postulate_collection|
            postulate_collection.destroy
          end
          @collections.each do |collection_id|
            PostulateCollection.create(postulate_id: @postulate.id, collection_id: collection_id)
          end
        else
          @collections = @postulate.offer.program.collections
          format.html { render '/postulates/chequeo', alert: 'Debe seleccionar por lo menos un recaudo' }
        end
        #@postulate.collections = @collections

      end
      if @postulate.update(postulate_params)
        if @postulate.decision == 'aprobado'
          #Notificar Via Mail
          PostulateMailer.sample_email(@postulate).deliver_now
        end
        format.html { redirect_to postulates_path, notice: "Operación exitosa."   }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @postulate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulates/1
  # DELETE /postulates/1.json
  def destroy
    @postulate.destroy
    respond_to do |format|
      format.html { redirect_to postulates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulate
      @postulate = Postulate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulate_params
      params.require(:postulate).permit(:sex_id, :civil_status_id, :decision, :postulate, :offer_id, :nombre, :cedula, :direccion, :sexo, :email, :telefono, :fecha_nacimiento, :estado_civil, :find_out_id, :city_id, :detail_id, :collections, :d, :postulate, :why_dcyt_id, :institution_id, :ownership_id, :area_interest_id)
    end
end