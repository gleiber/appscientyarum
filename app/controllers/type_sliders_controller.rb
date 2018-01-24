class TypeSlidersController < ApplicationController
  before_action :set_type_slider, only: [:show, :edit, :update, :destroy]

  # GET /type_sliders
  # GET /type_sliders.json
  def index
    @type_sliders = TypeSlider.all
  end

  # GET /type_sliders/1
  # GET /type_sliders/1.json
  def show
  end

  # GET /type_sliders/new
  def new
    @type_slider = TypeSlider.new
  end

  # GET /type_sliders/1/edit
  def edit
  end

  # POST /type_sliders
  # POST /type_sliders.json
  def create
    @type_slider = TypeSlider.new(type_slider_params)

    respond_to do |format|
      if @type_slider.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+Slider&tabla=TypeSlider' }
        format.json { render action: 'show', status: :created, location: @type_slider }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+Slider&tabla=TypeSlider' }
        format.json { render json: @type_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_sliders/1
  # PATCH/PUT /type_sliders/1.json
  def update
    respond_to do |format|
      if @type_slider.update(type_slider_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+Slider&tabla=TypeSlider'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_sliders/1
  # DELETE /type_sliders/1.json
  def destroy
    @type_slider.destroy
    respond_to do |format|
      format.html { redirect_to type_sliders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_slider
      @type_slider = TypeSlider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_slider_params
      params.require(:type_slider).permit(:descripcion)
    end
end
