class PostgraduateCoordinationsController < ApplicationController
  before_action :set_postgraduate_coordination, only: [:show, :edit, :update, :destroy]

  # GET /postgraduate_coordinations
  # GET /postgraduate_coordinations.json
  def index

      @postgraduate_coordination = PostgraduateCoordination.first
      @objectives = Objective.all
      @emails = Email.all
      @phones = Phone.all
  end

  # GET /postgraduate_coordinations/1
  # GET /postgraduate_coordinations/1.json
  def show

      @objectives   = Objective.all
      @emails       = Email.all
      @phones       = Phone.all

  end


def objetivos
       @objectives   = Objective.all
       render 'postgraduate_coordinations/objetivos'
  end

def telefonos
    @phones = Phone.all
    render 'postgraduate_coordinations/telefonos'
  end
 
  def correos
    @emails = Email.all
    render 'postgraduate_coordinations/correos'
  end



  # GET /postgraduate_coordinations/new
  def new
    @postgraduate_coordination = PostgraduateCoordination.new
  end

  # GET /postgraduate_coordinations/1/edit
  def edit


  end

  # POST /postgraduate_coordinations
  # POST /postgraduate_coordinations.json
  def create
    @postgraduate_coordination = PostgraduateCoordination.new(postgraduate_coordination_params)

    respond_to do |format|
      if @postgraduate_coordination.save
        format.html { redirect_to @postgraduate_coordination }
        format.json { render action: 'show', status: :created, location: @postgraduate_coordination }
      else
        format.html { render action: 'new' }
        format.json { render json: @postgraduate_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postgraduate_coordinations/1
  # PATCH/PUT /postgraduate_coordinations/1.json
  def update
    respond_to do |format|
      if @postgraduate_coordination.update(postgraduate_coordination_params)
        format.html { redirect_to postgraduate_coordinations_path, notice: "Modificacion exitosa" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @postgraduate_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postgraduate_coordinations/1
  # DELETE /postgraduate_coordinations/1.json
  def destroy
    @postgraduate_coordination.destroy
    respond_to do |format|
      format.html { redirect_to postgraduate_coordinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postgraduate_coordination
      @postgraduate_coordination = PostgraduateCoordination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postgraduate_coordination_params
      params.require(:postgraduate_coordination).permit(:descripcion, :mision, :vision,:direccion)
    end
end
