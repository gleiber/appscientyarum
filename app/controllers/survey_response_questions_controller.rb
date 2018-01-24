class SurveyResponseQuestionsController < ApplicationController
  before_action :set_survey_response_question, only: [:edit, :update, :destroy]

  # GET /survey_response_questions
  # GET /survey_response_questions.json
  def index
    @survey_response_questions = SurveyResponseQuestion.all
  end

  # GET /survey_response_questions/1
  # GET /survey_response_questions/1.json
  def show
  end

  # GET /survey_response_questions/new
  def new
    @survey_response_question = SurveyResponseQuestion.new
  end

  # GET /survey_response_questions/1/edit
  def edit
  end

  # POST /survey_response_questions
  # POST /survey_response_questions.json
  def create
    @survey_response_question = SurveyResponseQuestion.new(survey_response_question_params)

    respond_to do |format|
      if @survey_response_question.save
        format.html { redirect_to @survey_response_question, notice: 'Survey response question was successfully created.' }
        format.json { render :show, status: :created, location: @survey_response_question }
      else
        format.html { render :new }
        format.json { render json: @survey_response_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_response_questions/1
  # PATCH/PUT /survey_response_questions/1.json
  def update
    respond_to do |format|
      if @survey_response_question.update(survey_response_question_params)
        format.html { redirect_to @survey_response_question, notice: 'Survey response question was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_response_question }
      else
        format.html { render :edit }
        format.json { render json: @survey_response_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_response_questions/1
  # DELETE /survey_response_questions/1.json
  def destroy
    @survey_response_question.destroy
    respond_to do |format|
      format.html { redirect_to survey_response_questions_url, notice: 'Survey response question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response_question
      @survey_response_question = SurveyResponseQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_question_params
      params.require(:survey_response_question).permit(:survey_response_id, :question_id, :answer_id)
    end
end
