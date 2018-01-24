class QuestionPollsController < ApplicationController
  before_action :set_question_poll, only: [:show, :edit, :update, :destroy]

  # GET /question_polls
  # GET /question_polls.json
  def index
    @question_polls = QuestionPoll.all
  end

  # GET /question_polls/1
  # GET /question_polls/1.json
  def show
  end

  # GET /question_polls/new
  def new
    @question_poll = QuestionPoll.new
  end

  # GET /question_polls/1/edit
  def edit
  end

  # POST /question_polls
  # POST /question_polls.json
  def create
    @question_poll = QuestionPoll.new(question_poll_params)

    respond_to do |format|
      if @question_poll.save
        format.html { redirect_to @question_poll}
        format.json { render action: 'show', status: :created, location: @question_poll }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to @question_poll }
        format.json { render json: @question_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_polls/1
  # PATCH/PUT /question_polls/1.json
  def update
    respond_to do |format|
      if @question_poll.update(question_poll_params)
        format.html { redirect_to @question_poll}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_polls/1
  # DELETE /question_polls/1.json
  def destroy
    @question_poll.destroy
    respond_to do |format|
      format.html { redirect_to question_polls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_poll
      @question_poll = QuestionPoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_poll_params
      params.require(:question_poll).permit(:question_id, :poll_id)
    end
end
