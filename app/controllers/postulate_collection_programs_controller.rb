class PostulateCollectionProgramsController < ApplicationController
  before_action :set_postulate_collection_program, only: [:show, :edit, :update, :destroy]

  # GET /postulate_collection_programs
  # GET /postulate_collection_programs.json
  def index
    @postulate_collection_programs = PostulateCollectionProgram.all
  end

  # GET /postulate_collection_programs/1
  # GET /postulate_collection_programs/1.json
  def show
  end

  # GET /postulate_collection_programs/new
  def new
    @postulate_collection_program = PostulateCollectionProgram.new
  end

  # GET /postulate_collection_programs/1/edit
  def edit
  end

  # POST /postulate_collection_programs
  # POST /postulate_collection_programs.json
  def create
    @postulate_collection_program = PostulateCollectionProgram.new(postulate_collection_program_params)

    respond_to do |format|
      if @postulate_collection_program.save
        format.html { redirect_to @postulate_collection_program }
        format.json { render action: 'show', status: :created, location: @postulate_collection_program }
      else
        format.html { render action: 'new' }
        format.json { render json: @postulate_collection_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulate_collection_programs/1
  # PATCH/PUT /postulate_collection_programs/1.json
  def update
    respond_to do |format|
      if @postulate_collection_program.update(postulate_collection_program_params)
        format.html { redirect_to @postulate_collection_program }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @postulate_collection_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulate_collection_programs/1
  # DELETE /postulate_collection_programs/1.json
  def destroy
    @postulate_collection_program.destroy
    respond_to do |format|
      format.html { redirect_to postulate_collection_programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulate_collection_program
      @postulate_collection_program = PostulateCollectionProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulate_collection_program_params
      params.require(:postulate_collection_program).permit(:postulate_id, :collection_program_id, :estado)
    end
end
