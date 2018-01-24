class TypeReasonsController < ApplicationController
  before_action :set_type_reason, only: [:show, :edit, :update, :destroy]

  # GET /type_reasons
  # GET /type_reasons.json
  def index
    @type_reasons = TypeReason.all
  end

  # GET /type_reasons/1
  # GET /type_reasons/1.json
  def show
  end

  # GET /type_reasons/new
  def new
    @type_reason = TypeReason.new
  end

  # GET /type_reasons/1/edit
  def edit
  end

  # POST /type_reasons
  # POST /type_reasons.json
  def create
    @type_reason = TypeReason.new(type_reason_params)

    respond_to do |format|
      if @type_reason.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Motivo&tabla=TypeReason'}
        format.json { render action: 'show', status: :created, location: @type_reason }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Motivo&tabla=TypeReason'}
        format.json { render json: @type_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_reasons/1
  # PATCH/PUT /type_reasons/1.json
  def update
    respond_to do |format|
      if @type_reason.update(type_reason_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Motivo&tabla=TypeReason'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_reasons/1
  # DELETE /type_reasons/1.json
  def destroy
    @type_reason.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Motivo&tabla=TypeReason' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_reason
      @type_reason = TypeReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_reason_params
      params.require(:type_reason).permit(:descripcion)
    end
end
