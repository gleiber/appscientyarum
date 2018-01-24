class SubjectUsersController < ApplicationController
  before_action :set_subject_user, only: [:show, :edit, :update, :destroy]

  # GET /subject_users
  # GET /subject_users.json
  def index
    @subject_users = SubjectUser.all
  end

  # GET /subject_users/1
  # GET /subject_users/1.json
  def show
  end

  # GET /subject_users/new
  def new
    @subject_user = SubjectUser.new
  end

  # GET /subject_users/1/edit
  def edit
    @cohort_period = CohortPeriod.find(params[:c])
    cohort_program = @cohort_period.cohort_program
    @cohort_periods = cohort_program.cohort_periods
    role = Role.find_by(descripcion: "Profesor")
    @users = User.where(role_id: role.id)
  end

  # POST /subject_users
  # POST /subject_users.json
  def create
    @subject_user = SubjectUser.new(subject_user_params)
    respond_to do |format|
      if @subject_user.save
        format.html { redirect_to '/maestricos/prueba?titulo=Materias&tabla=subject' }
        format.json { render action: 'show', status: :created, location: @subject_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @subject_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_users/1
  # PATCH/PUT /subject_users/1.json
  def update
    respond_to do |format|
      if (params[:cohort_period_id].present?)
        coh_per_sub_u = @subject_user.coh_per_sub_u
        coh_per_sub_u.update(cohort_period_id: params[:cohort_period_id])
      end
      if (params[:user_id_nuevo].present?)
        if @subject_user.update(user_id: params[:user_id_nuevo])
          format.html { redirect_to cohorts_path()}
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @subject_user.errors, status: :unprocessable_entity }
        end
      else
          format.html { redirect_to cohorts_path}
          format.json { head :no_content }
      end
    end
  end

  # DELETE /subject_users/1
  # DELETE /subject_users/1.json
  def destroy
    @subject_user.destroy
    respond_to do |format|
      format.html { redirect_to subject_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_user
      @subject_user = SubjectUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_user_params
      params.require(:subject_user).permit(:subject_id, :user_id, :cohort_period_id, :user_id_nuevo)
    end
end
