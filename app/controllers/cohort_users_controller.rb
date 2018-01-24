class CohortUsersController < ApplicationController
  before_action :set_cohort_user, only: [:show, :edit, :update, :destroy]

  # GET /cohort_users
  # GET /cohort_users.json
  def index
    @cohort_users = CohortUser.all
  end

  # GET /cohort_users/1
  # GET /cohort_users/1.json
  def show
  end

  # GET /cohort_users/new
  def new
    @cohort_user = CohortUser.new
  end

  # GET /cohort_users/1/edit
  def edit
  end

  # POST /cohort_users
  # POST /cohort_users.json
  def create
    @cohort_user = CohortUser.new(cohort_user_params)

    respond_to do |format|
      if @cohort_user.save
        format.html { redirect_to @cohort_user }
        format.json { render :show, status: :created, location: @cohort_user }
      else
        format.html { render :new }
        format.json { render json: @cohort_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohort_users/1
  # PATCH/PUT /cohort_users/1.json
  def update
    respond_to do |format|
      if @cohort_user.update(cohort_user_params)
        format.html { redirect_to @cohort_user }
        format.json { render :show, status: :ok, location: @cohort_user }
      else
        format.html { render :edit }
        format.json { render json: @cohort_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohort_users/1
  # DELETE /cohort_users/1.json
  def destroy
    @cohort_user.destroy
    respond_to do |format|
      format.html { redirect_to cohort_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort_user
      @cohort_user = CohortUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_user_params
      params.require(:cohort_user).permit(:cohort_id, :user_id)
    end
end
