class TypePollsController < ApplicationController
  before_action :set_type_poll, only: [:show, :edit, :update, :destroy]

  # GET /type_polls
  # GET /type_polls.json
  def index
    @type_polls = TypePoll.all
  end

  # GET /type_polls/1
  # GET /type_polls/1.json
  def show
  end

  # GET /type_polls/new
  def new
    @type_poll = TypePoll.new
  end

  # GET /type_polls/1/edit
  def edit
  end

  # POST /type_polls
  # POST /type_polls.json
  def create
    @type_poll = TypePoll.new(type_poll_params)

    respond_to do |format|
      if @type_poll.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Encuesta&tabla=TypePoll' }
        format.json { render action: 'show', status: :created, location: @type_poll }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Encuesta&tabla=TypePoll' }
        format.json { render json: @type_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_polls/1
  # PATCH/PUT /type_polls/1.json
  def update
    respond_to do |format|
      if @type_poll.update(type_poll_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Encuesta&tabla=TypePoll' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_polls/1
  # DELETE /type_polls/1.json
  def destroy
    @type_poll.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Encuesta&tabla=TypePoll' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_poll
      @type_poll = TypePoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_poll_params
      params.require(:type_poll).permit(:descripcion)
    end
end
