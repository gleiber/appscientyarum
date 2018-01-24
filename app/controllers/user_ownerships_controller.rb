class UserOwnershipsController < ApplicationController
  before_action :set_user_ownership, only: [:show, :edit, :update, :destroy]

  # GET /user_ownerships
  # GET /user_ownerships.json
  def index
    @user_ownerships = UserOwnership.all
  end

  # GET /user_ownerships/1
  # GET /user_ownerships/1.json
  def show
  end

  # GET /user_ownerships/new
  def new
    @user_ownership = UserOwnership.new
  end

  # GET /user_ownerships/1/edit
  def edit
  end

  # POST /user_ownerships
  # POST /user_ownerships.json
  def create
    @user_ownership = UserOwnership.new(user_ownership_params)

    respond_to do |format|
      if @user_ownership.save
        format.html { redirect_to @user_ownership }
        format.json { render :show, status: :created, location: @user_ownership }
      else
        format.html { render :new }
        format.json { render json: @user_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_ownerships/1
  # PATCH/PUT /user_ownerships/1.json
  def update
    respond_to do |format|
      if @user_ownership.update(user_ownership_params)
        format.html { redirect_to @user_ownership }
        format.json { render :show, status: :ok, location: @user_ownership }
      else
        format.html { render :edit }
        format.json { render json: @user_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_ownerships/1
  # DELETE /user_ownerships/1.json
  def destroy
    @user_ownership.destroy
    respond_to do |format|
      format.html { redirect_to user_ownerships_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ownership
      @user_ownership = UserOwnership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_ownership_params
      params.require(:user_ownership).permit(:user_id, :ownership_id)
    end
end
