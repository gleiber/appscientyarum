class HistoryNotesController < ApplicationController
  before_action :set_history_note, only: [:show, :edit, :update, :destroy]

  # GET /history_notes
  # GET /history_notes.json
  def index
    @history_notes = HistoryNote.all
  end

  # GET /history_notes/1
  # GET /history_notes/1.json
  def show
  end

  # GET /history_notes/new
  def new
    @history_note = HistoryNote.new
  end

  # GET /history_notes/1/edit
  def edit
  end

  # POST /history_notes
  # POST /history_notes.json
  def create
    @history_note = HistoryNote.new(history_note_params)

    respond_to do |format|
      if @history_note.save
        format.html { redirect_to @history_note}
        format.json { render action: 'show', status: :created, location: @history_note }
      else
        format.html { render action: 'new' }
        format.json { render json: @history_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_notes/1
  # PATCH/PUT /history_notes/1.json
  def update
    respond_to do |format|
      if @history_note.update(history_note_params)
        format.html { redirect_to @history_note }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @history_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_notes/1
  # DELETE /history_notes/1.json
  def destroy
    @history_note.destroy
    respond_to do |format|
      format.html { redirect_to history_notes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_note
      @history_note = HistoryNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_note_params
      params.require(:history_note).permit(:cohorte, :periodo, :participante, :materia, :nota)
    end
end
