class ContactAboutsController < ApplicationController
  before_action :set_contact_about, only: [:show, :edit, :update, :destroy]

  # GET /contact_abouts
  # GET /contact_abouts.json
  def index
    @contact_abouts = ContactAbout.all
  end

  # GET /contact_abouts/1
  # GET /contact_abouts/1.json
  def show
  end

  # GET /contact_abouts/new
  def new
    @contact_about = ContactAbout.new
  end

  # GET /contact_abouts/1/edit
  def edit
  end

  # POST /contact_abouts
  # POST /contact_abouts.json
  def create
    @contact_about = ContactAbout.new(contact_about_params)

    respond_to do |format|
      if @contact_about.save
        format.html { redirect_to '/maestricos/prueba?titulo=Contacto+Sobre&tabla=ContactAbouts' }
        format.json { render :show, status: :created, location: @contact_about }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Contacto+Sobre&tabla=ContactAbouts'}
        format.json { render json: @contact_about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_abouts/1
  # PATCH/PUT /contact_abouts/1.json
  def update
    respond_to do |format|
      if @contact_about.update(contact_about_params)
        format.html { redirect_to @contact_about}
        format.json { render :show, status: :ok, location: @contact_about }
      else
        format.html { render :edit }
        format.json { render json: @contact_about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_abouts/1
  # DELETE /contact_abouts/1.json
  def destroy
    @contact_about.destroy
    respond_to do |format|
      format.html { redirect_to contact_abouts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_about
      @contact_about = ContactAbout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_about_params
      params.require(:contact_about).permit(:descripcion)
    end
end
