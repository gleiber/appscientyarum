class ReviewThesesController < ApplicationController
  before_action :set_review_thesis, only: [:edit, :update, :destroy]

  # GET /review_theses
  # GET /review_theses.json
  def index
    @review_theses = ReviewThesis.all
    @theses = Thesis.all
    @type_reviews = TypeReview.all
 
  end

  # GET /review_theses/1
  # GET /review_theses/1.json
  def show
    @thesis = Thesis.find(params[:thesis_id])
    @review_theses = @thesis.review_theses
  end

  # GET /review_theses/new
  def new
    @thesis = Thesis.find(params[:thesis_id])
    @review_thesis = ReviewThesis.new
    @type_reviews = TypeReview.all
  end
   

  # GET /review_theses/1/edit
  def edit
  end

  # POST /review_theses
  # POST /review_theses.json
  def create
    @review_thesis = ReviewThesis.new(review_thesis_params)
    #@review_thesis.thesis_id = params[:thesis_id]
    @review_thesis.type_review_id = params[:type_review_id]
    respond_to do |format|

      
      if @review_thesis.save
        Tracing.create(thesis_id: @review_thesis.thesis_id, descripcion: "Tesis/TEG "+ @review_thesis.type_review.descripcion)
        #Notificar a los usuarios via correo y aplicativo
        ThesesReviewMailer.sample_email(@review_thesis).deliver_now
        if @review_thesis.type_review_id == 1
          #Creamos un nuevo registro de calificacion
          @program_calification = ProgramCalification.new()
          @program_calification.user_id = @review_thesis.thesis.user.id
          @cohort_user = CohortUser.where(:user_id => @review_thesis.thesis.user.id)
          if !@cohort_user.nil?
            @cohort_user.each do |cu|
              @cohort_program = CohortProgram.find(cu.cohort_program_id)
              if !@cohort_program.nil?
                @program_calification.program_id = @cohort_program.program_id
              end
            end
          end
          if @program_calification.save
            #Enviamos un correo para que califique al programa
            ProgramCalificationMailer.sample_email(@program_calification).deliver_now
          end
        end
        #Notificacion por intranet
        @descrip = "Se te ha hecho una revisión a la tesis: "+Thesis.find(@review_thesis.thesis_id).titulo+", la cual obtuvo la revisión: "+TypeReview.find(params[:type_review_id].to_i).descripcion
        if params[:review_thesis][:descripcion].to_s.strip != ""
          @descrip = @descrip+", y con las siguientes observaciones: "+params[:review_thesis][:descripcion].to_s.strip
        end

        notific = Notification.create(tittle: "Nueva revisión de tesis",
                                      event: @descrip.to_s,
                                      viewed: FALSE,
                                      id_user: @review_thesis.thesis.user.id,
                                      id_publisher: current_user.id,
                                      url: "localhost:3000/notifications")

        publicar_notificacion(notific.tittle,"Hace un momento",current_user.nombre.to_s+"("+current_user.username.to_s+")", notific.id_user,
                              notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)

        format.html { redirect_to review_theses_path  , notice: 'Evaluación creada exitosamente'}
        format.json { render action: 'show', status: :created, location: @review_thesis }
      else
        @type_reviews = TypeReview.all
        @thesis = @review_thesis.thesis

        format.html { redirect_to '/review_theses/new?'+{thesis_id: @thesis.id}.to_param, alert: 'Debe Llenar todos los Campos'}
        format.json { render json: @review_thesis.errors, status: :unprocessable_entity }

      end
    end
  end



  # PATCH/PUT /review_theses/1
  # PATCH/PUT /review_theses/1.json
  def update
    respond_to do |format|
      if @review_thesis.update(review_thesis_params)
        format.html { redirect_to @review_thesis}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review_thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_theses/1
  # DELETE /review_theses/1.json
  def destroy
    @review_thesis.destroy
    respond_to do |format|
      format.html { redirect_to review_theses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    def set_review_thesis
      @thesis = Thesis.find(params[:id])
      @review_thesis = ReviewThesis.find(:thesis_id => params[:id])
    end



  

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_thesis_params 
      params.require(:review_thesis).permit(:id, :thesis_id, :type_review, :descripcion)
    end
end
