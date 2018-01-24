class TypePollRolesController < ApplicationController
  before_action :set_type_poll_role, only: [:show, :edit, :update, :destroy]

  # GET /type_poll_roles
  # GET /type_poll_roles.json
  def index
    @type_poll_roles = TypePollRole.all
  end

  # GET /type_poll_roles/1
  # GET /type_poll_roles/1.json
  def show
  end

  # GET /type_poll_roles/new
  def new
    @type_poll_role = TypePollRole.new
  end

  # GET /type_poll_roles/1/edit
  def edit
  end

  # POST /type_poll_roles
  # POST /type_poll_roles.json
  def create
    @type_poll_role = TypePollRole.new(type_poll_role_params)

    respond_to do |format|
      if @type_poll_role.save
        format.html { redirect_to @type_poll_role}
        format.json { render action: 'show', status: :created, location: @type_poll_role }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_poll_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_poll_roles/1
  # PATCH/PUT /type_poll_roles/1.json
  def update
    respond_to do |format|
      if @type_poll_role.update(type_poll_role_params)
        format.html { redirect_to @type_poll_role}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_poll_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_poll_roles/1
  # DELETE /type_poll_roles/1.json
  def destroy
    @type_poll_role.destroy
    respond_to do |format|
      format.html { redirect_to type_poll_roles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_poll_role
      @type_poll_role = TypePollRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_poll_role_params
      params.require(:type_poll_role).permit(:type_poll_id, :role_id)
    end
end
