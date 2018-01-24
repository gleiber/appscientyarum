class CollectionProgramsController < ApplicationController
  before_action :set_collection_program, only: [:show, :edit, :update, :destroy]

  # GET /collection_programs
  # GET /collection_programs.json
  def index
    @collection_programs = CollectionProgram.all
  end

  # GET /collection_programs/1
  # GET /collection_programs/1.json
  def show
  end

  # GET /collection_programs/new
  def new
    @collection_program = CollectionProgram.new
  end

  # GET /collection_programs/1/edit
  def edit
  end

  # POST /collection_programs
  # POST /collection_programs.json
  def create
    @collection_program = CollectionProgram.new(collection_program_params)

    respond_to do |format|
      if @collection_program.save
        format.html { redirect_to @collection_program }
        format.json { render action: 'show', status: :created, location: @collection_program }
      else
        format.html { render action: 'new' }
        format.json { render json: @collection_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_programs/1
  # PATCH/PUT /collection_programs/1.json
  def update
    respond_to do |format|
      if @collection_program.update(collection_program_params)
        format.html { redirect_to @collection_program }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @collection_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_programs/1
  # DELETE /collection_programs/1.json
  def destroy
    @collection_program.destroy
    respond_to do |format|
      format.html { redirect_to collection_programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_program
      @collection_program = CollectionProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_program_params
      params.require(:collection_program).permit(:program_id, :collection_id)
    end
end
