class ProgramSubjectsController < ApplicationController
  before_action :set_program_subject, only: [:show, :edit, :update, :destroy]

  # GET /program_subjects
  # GET /program_subjects.json
  def index
    @program_subjects = ProgramSubject.all
  end

  # GET /program_subjects/1
  # GET /program_subjects/1.json
  def show
  end

  # GET /program_subjects/new
  def new
    @program_subject = ProgramSubject.new
  end

  # GET /program_subjects/1/edit
  def edit
  end

  # POST /program_subjects
  # POST /program_subjects.json
  def create
    @program_subject = ProgramSubject.new(program_subject_params)

    respond_to do |format|
      if @program_subject.save
        format.html { redirect_to @program_subject}
        format.json { render :show, status: :created, location: @program_subject }
      else
        format.html { render :new }
        format.json { render json: @program_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_subjects/1
  # PATCH/PUT /program_subjects/1.json
  def update
    respond_to do |format|
      if @program_subject.update(program_subject_params)
        format.html { redirect_to @program_subject}
        format.json { render :show, status: :ok, location: @program_subject }
      else
        format.html { render :edit }
        format.json { render json: @program_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_subjects/1
  # DELETE /program_subjects/1.json
  def destroy
    @program_subject.destroy
    respond_to do |format|
      format.html { redirect_to program_subjects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_subject
      @program_subject = ProgramSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_subject_params
      params.require(:program_subject).permit(:subject_id, :program_id)
    end
end
