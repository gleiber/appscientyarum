class FindOutsController < ApplicationController
  before_action :set_find_out, only: [:show, :edit, :update, :destroy]

  # GET /find_outs
  # GET /find_outs.json
  def index
    @find_outs = FindOut.all
  end

  # GET /find_outs/1
  # GET /find_outs/1.json
  def show
  end

  # GET /find_outs/new
  def new
    @find_out = FindOut.new
  end

  # GET /find_outs/1/edit
  def edit
  end

  # POST /find_outs
  # POST /find_outs.json
  def create
    @find_out = FindOut.new(find_out_params)

    respond_to do |format|
      if @find_out.save
        format.html { redirect_to '/maestricos/prueba?titulo=Como+Se+Entero&tabla=FindOut' }
        format.json { render :show, status: :created, location: @find_out }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Como+Se+Entero&tabla=FindOut'}
        format.json { render json: @find_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /find_outs/1
  # PATCH/PUT /find_outs/1.json
  def update
    respond_to do |format|
      if @find_out.update(find_out_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Como+Se+Entero&tabla=FindOut' }
        format.json { render :show, status: :ok, location: @find_out }
      else
        format.html { redirect_to '/maestricos/edit?tabla=FindOut&tabla_id='+@find_out.id.to_s }
        format.json { render json: @find_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /find_outs/1
  # DELETE /find_outs/1.json
  def destroy
    @find_out.destroy
    respond_to do |format|
      format.html { redirect_to find_outs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_find_out
      @find_out = FindOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def find_out_params
      params.require(:find_out).permit(:descripcion)
    end
end
