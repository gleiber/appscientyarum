class TypeSubjectsController < ApplicationController
  before_action :set_type_subject, only: [:show, :edit, :update, :destroy]

  # GET /type_subjects
  # GET /type_subjects.json
  def index
    @type_subjects = TypeSubject.all
  end

  # GET /type_subjects/1
  # GET /type_subjects/1.json
  def show
  end

  # GET /type_subjects/new
  def new
    @type_subject = TypeSubject.new
  end

  # GET /type_subjects/1/edit
  def edit
  end

  # POST /type_subjects
  # POST /type_subjects.json
  def create
    @type_subject = TypeSubject.new(type_subject_params)

    respond_to do |format|
      if @type_subject.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Materia&tabla=Type_Subjects'}
        format.json { render :show, status: :created, location: @type_subject }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html {redirect_to '/maestricos/prueba?titulo=Tipo+de+Materia&tabla=Type_Subjects'}
        format.json { render json: @type_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_subjects/1
  # PATCH/PUT /type_subjects/1.json
  def update
    respond_to do |format|
      if @type_subject.update(type_subject_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Materia&tabla=Type_Subjects' }
        format.json { render :show, status: :ok, location: @type_subject }
      else
        format.html { render :edit }
        format.json { render json: @type_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_subjects/1
  # DELETE /type_subjects/1.json
  def destroy
    @type_subject.destroy
    respond_to do |format|
      format.html { redirect_to type_subjects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_subject
      @type_subject = TypeSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_subject_params
      params.require(:type_subject).permit(:descripcion, :subject_id)
    end
end
