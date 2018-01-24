class TypeOpinionsController < ApplicationController
  before_action :set_type_opinion, only: [:show, :edit, :update, :destroy]

  # GET /type_opinions
  # GET /type_opinions.json
  def index
    @type_opinions = TypeOpinion.all
  end

  # GET /type_opinions/1
  # GET /type_opinions/1.json
  def show
  end

  # GET /type_opinions/new
  def new
    @type_opinion = TypeOpinion.new
  end

  # GET /type_opinions/1/edit
  def edit
  end

  # POST /type_opinions
  # POST /type_opinions.json
  def create
    @type_opinion = TypeOpinion.new(type_opinion_params)

    respond_to do |format|
      if @type_opinion.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Opinion&tabla=TypeOpinion' }
        format.json { render action: 'show', status: :created, location: @type_opinion }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Opinion&tabla=TypeOpinion' }
        format.json { render json: @type_opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_opinions/1
  # PATCH/PUT /type_opinions/1.json
  def update
    respond_to do |format|
      if @type_opinion.update(type_opinion_params)
        format.html { redirect_to @type_opinion }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_opinions/1
  # DELETE /type_opinions/1.json
  def destroy
    @type_opinion.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Opinion&tabla=TypeOpinion' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_opinion
      @type_opinion = TypeOpinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_opinion_params
      params.require(:type_opinion).permit(:descripcion)
    end
end
