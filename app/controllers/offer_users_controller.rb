class OfferUsersController < ApplicationController
  before_action :set_offer_user, only: [:show, :edit, :update, :destroy]

  # GET /offer_users
  # GET /offer_users.json
  def index
    @offer_users = OfferUser.all
    @offer_user = OfferUser.new
  end

  # GET /offer_users/1
  # GET /offer_users/1.json
  def show
  end
  def json_table
    @offer_users = OfferUser.find_by(:offer_id, params[:id])
    render json: {success: true, body: @offer_users.body}
  end

  # GET /offer_users/new
  def new
    @offer_user = OfferUser.new
  end

  # GET /offer_users/1/edit
  def edit
  end

  # POST /offer_users
  # POST /offer_users.json
  def create
    @offer_user = OfferUser.new(offer_user_params)

    respond_to do |format|
      if @offer_user.save
        format.html { redirect_to @offer_user }
        format.json { render :show, status: :created, location: @offer_user }
      else
        format.html { render :new }
        format.json { render json: @offer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_users/1
  # PATCH/PUT /offer_users/1.json
  def update
    respond_to do |format|
      if @offer_user.update(offer_user_params)
        format.html { redirect_to @offer_user }
        format.json { render :show, status: :ok, location: @offer_user }
      else
        format.html { render :edit }
        format.json { render json: @offer_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_users/1
  # DELETE /offer_users/1.json
  def destroy
    @offer_user.destroy
    respond_to do |format|
      format.html { redirect_to offer_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_user
      @offer_user = OfferUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_user_params
      params.require(:offer_user).permit(:offer_id, :user_id)
    end
end
