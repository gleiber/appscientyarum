class UserAreaInterestsController < ApplicationController
  before_action :set_user_area_interest, only: [:show, :edit, :update, :destroy]

  # GET /user_area_interests
  # GET /user_area_interests.json
  def index
    @user_area_interests = UserAreaInterest.all
  end

  # GET /user_area_interests/1
  # GET /user_area_interests/1.json
  def show
  end

  # GET /user_area_interests/new
  def new
    @user_area_interest = UserAreaInterest.new
  end

  # GET /user_area_interests/1/edit
  def edit
  end

  # POST /user_area_interests
  # POST /user_area_interests.json
  def create
    @user_area_interest = UserAreaInterest.new(user_area_interest_params)

    respond_to do |format|
      if @user_area_interest.save
        format.html { redirect_to @user_area_interest }
        format.json { render action: 'show', status: :created, location: @user_area_interest }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_area_interests/1
  # PATCH/PUT /user_area_interests/1.json
  def update
    respond_to do |format|
      if @user_area_interest.update(user_area_interest_params)
        format.html { redirect_to @user_area_interest }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_area_interests/1
  # DELETE /user_area_interests/1.json
  def destroy
    @user_area_interest.destroy
    respond_to do |format|
      format.html { redirect_to user_area_interests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_area_interest
      @user_area_interest = UserAreaInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_area_interest_params
      params.require(:user_area_interest).permit(:area_interest_id, :user_id, :descripcion)
    end
end
