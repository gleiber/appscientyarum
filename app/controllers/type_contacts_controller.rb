class TypeContactsController < ApplicationController
  before_action :set_type_contact, only: [:show, :edit, :update, :destroy]

  # GET /type_contacts
  # GET /type_contacts.json
  def index
    @type_contacts = TypeContact.all
  end
  def reporte_tipo_contacto
    
  end
  def update_contactos
    type_contact= TypeContact.find(params[:type_contact_id])
    @contacts = type_contact.contacts.where('created_at BETWEEN ? AND ?', params[:fecha_desde], params[:fecha_hasta])
    respond_to do |format|
      format.js
    end
  end

  # GET /type_contacts/1
  # GET /type_contacts/1.json
  def show
  end

  # GET /type_contacts/new
  def new
    @type_contact = TypeContact.new
  end

  # GET /type_contacts/1/edit
  def edit
  end

  # POST /type_contacts
  # POST /type_contacts.json
  def create
    @type_contact = TypeContact.new(type_contact_params)

    respond_to do |format|
      if @type_contact.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+Contacto&tabla=TypeContacts'}
        format.json { render :show, status: :created, location: @type_contact }
      else
        flash.now[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+Contacto&tabla=TypeContacts'}
        format.json { render json: @type_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_contacts/1
  # PATCH/PUT /type_contacts/1.json
  def update
    respond_to do |format|
      if @type_contact.update(type_contact_params)
        format.html { redirect_to @type_contact}
        format.json { render :show, status: :ok, location: @type_contact }
      else
        format.html { render :edit }
        format.json { render json: @type_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_contacts/1
  # DELETE /type_contacts/1.json
  def destroy
    @type_contact.destroy
    respond_to do |format|
      format.html { redirect_to type_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_contact
      @type_contact = TypeContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_contact_params
      params.require(:type_contact).permit(:descripcion,:type_contact_id, :fecha_desde, :fecha_hasta)
    end
end
