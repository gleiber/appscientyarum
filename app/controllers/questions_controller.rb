class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @answers = Answer.all
  end

  # GET /questions/1/edit
  def edit
    @answers = Answer.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @answers= params[:answers]

    respond_to do |format|
      if @question.save
        @answers.each do |answer_id|
          QuestionAnswer.create(question_id: @question.id, answer_id: answer_id)
        end
        format.html { redirect_to '/questions' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update

    respond_to do |format|

      if @question.update(question_params)
        @answers= params[:answers]
        if (@answers)
          @question_answers = QuestionAnswer.where(question_id: @question.id)
          @question_answers.each do |question_answer|
            question_answer.destroy
          end
          @answers.each do |answer_id|
            QuestionAnswer.create(question_id: @question.id, answer_id: answer_id)
          end
        else
          @collections = Collection.all
          format.html { render '/postulates/chequeo', notice: 'Debe seleccionar por lo menos un recaudo' }
        end
        format.html { redirect_to '/questions' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end

    end

  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Preguntas+de+Encuestas&tabla=Question' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:descripcion)
    end
end


