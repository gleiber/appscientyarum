class SubPerUsersController < ApplicationController
  before_action :set_sub_per_user, only: [:show, :edit, :update, :destroy]

  # GET /sub_per_users
  # GET /sub_per_users.json
  def index
    @sub_per_users = SubPerUser.all
  end

  # GET /sub_per_users/1
  # GET /sub_per_users/1.json
  def show
  end

  # GET /sub_per_users/new
  def new
    @sub_per_user = SubPerUser.new
  end

  # GET /sub_per_users/1/edit
  def edit
  end

  # POST /sub_per_users
  # POST /sub_per_users.json
  def create
    @sub_per_user = SubPerUser.new(sub_per_user_params)

    respond_to do |format|
      if @sub_per_user.save
        format.html { redirect_to @sub_per_user}
        format.json { render :show, status: :created, location: @sub_per_user }
      else
        format.html { render :new }
        format.json { render json: @sub_per_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_grades
    user_id = params[:id]
    @sub_per_users = SubPerUser.where(user_id: user_id).where.not(nota: nil)

    respond_to do |format|
      if @sub_per_users 
        format.json { render json: @sub_per_users, :status => :ok}
      else
        format.json { render json: @sub_per_users, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_per_users/1
  # PATCH/PUT /sub_per_users/1.json
  def update
    respond_to do |format|
      if @sub_per_user.update(sub_per_user_params)
        format.html { redirect_to @sub_per_user }
        format.json { render :show, status: :ok, location: @sub_per_user }
      else
        format.html { render :edit }
        format.json { render json: @sub_per_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_per_users/1
  # DELETE /sub_per_users/1.json
  def destroy
    @sub_per_user.destroy
    respond_to do |format|
      format.html { redirect_to sub_per_users_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_per_user
      @sub_per_user = SubPerUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_per_user_params
      params.require(:sub_per_user).permit(:nota, :user_id, :coh_per_sub_us_id)
    end
end
