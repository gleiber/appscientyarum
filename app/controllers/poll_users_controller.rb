class PollUsersController < ApplicationController
  before_action :set_poll_user, only: [:show, :edit, :update, :destroy]

  # GET /poll_users
  # GET /poll_users.json
  def index
    @poll_users = PollUser.all
  end
  def poll_profesores
    @line_investigations = LineInvestigation.all
    @area_interests = AreaInterest.all
    @users = User.all
  end
  def update_line_investigation_poll
    @line_investigation = LineInvestigation.find(params[:line_investigation_id])
    @area_interests = @line_investigation.area_interests
    puts "========"
    puts @area_interests.to_json
    respond_to do |format|
      format.js
    end
  end
  def update_poll
    @area_interest = AreaInterest.find(params[:area_interest_id])
    @users = @area_interest.users
    respond_to do |format|
      format.js
    end
  end

  # GET /poll_users/1
  # GET /poll_users/1.json
  def show
  end

  # GET /poll_users/new
  def new
    @poll_user = PollUser.new
  end

  # GET /poll_users/1/edit
  def edit
  end

  # POST /poll_users
  # POST /poll_users.json
  def create
    @poll_user = PollUser.new(poll_user_params)

    respond_to do |format|
      if @poll_user.save
        format.html { redirect_to @poll_user }
        format.json { render action: 'show', status: :created, location: @poll_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @poll_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poll_users/1
  # PATCH/PUT /poll_users/1.json
  def update
    respond_to do |format|
      if @poll_user.update(poll_user_params)
        format.html { redirect_to @poll_user}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poll_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_users/1
  # DELETE /poll_users/1.json
  def destroy
    @poll_user.destroy
    respond_to do |format|
      format.html { redirect_to poll_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_user
      @poll_user = PollUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_user_params
      params.require(:poll_user).permit(:user_id, :poll_id, :area_interest_id, :line_investigation_id)
    end
end
