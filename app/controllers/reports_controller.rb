class ReportsController < ApplicationController
  before_action :set_thesis_teg_presented, only: [:pie,:bar]
  before_action :set_project_presented, only: [:pie,:scatter,:bar]
  before_action :set_encuestas_data, only: [:pie3d]

  def set_encuestas_data
    if params[:encuesta] != nil
      $poll = Poll.find(params[:encuesta].to_i)
      $tittle = $poll.descripcion.upcase
      $preguntas = $poll.questions
      $sexos = []
      $sexos.push("Masculino")
      $sexos.push("Femenino")
      $sexos_counter = []
      @survey_response = SurveyResponse.where(:poll_id => params[:encuesta])
      if @survey_response.count != 0
        @counter_male = 0
        @counter_female = 0
        @survey_response.each do |survey|
          if survey.sexo.downcase == "femenino"
            @counter_female = @counter_female +1
          else
            @counter_male = @counter_male +1
          end
        end
          #Registramos los contadores
        $sexos_counter.push(@counter_male)
        $sexos_counter.push(@counter_female)
      end
    end #Fin de validador para encuesta distinto de Nill


  end
  def render_genre_poll_json
    respond_to do |format|
      format.json { render json: {titulo: $tittle,sexos:$sexos,sexos_counter:$sexos_counter}}
    end
  end

  def render_question_answer_json
    @question = Question.find(params[:id].to_i)
    @question_answer = QuestionAnswer.where(:question_id => @question.id)
    @titulo = @question.descripcion.upcase
    @answer = []
    @answer_counter = []
    @answers = @question.answers
    if @answers.count > 0
      @answers.each do |a|
        @answer.push(a.descripcion)
          if $poll.survey_responses.count > 0
          @cont = 0
          $poll.survey_responses.each do |sr|
            @cont = @cont + SurveyResponseQuestion.where(:survey_response_id => sr.id).where(:question_id => @question.id)
                               .where(:answer_id => a.id).count
          end
          @answer_counter.push(@cont)
        end


      end
    end
    respond_to do |format|
      format.json { render json: {titulo: @titulo,respuestas:@answer,contador_respuestas:@answer_counter}}
    end
  end


    def render_postulates_json
      @postulates_per_months_counts = []



      respond_to do |format|
        format.json { render json: {interesados:@interested}}
      end
    end


  def interested
    if params[:program] != nil
      @interested = Interested.where(:program_id => params[:program][:id].to_i)
      respond_to do |format|
        format.json { render json: {interesados:@interested}}
      end

    end
  end

  def clasifications
    if params[:program] != nil
      @clasifications = []
      @usuarios = []
      @program_califications = ProgramCalification.where(:program_id => params[:program][:id].to_i)
      if !@program_califications.nil?
        @program_califications.each do |pc|
          @clasifications.push(pc)
          @usuarios.push(User.find(pc.user_id))
        end
      end
      respond_to do |format|
        format.json { render json: {califications:@clasifications,usuarios: @usuarios}}
      end
    end
  end

  def thesis_program
    if params[:program] != nil
      @theses = []
      @usuarios = []
      @cohort_program = CohortProgram.where(:program_id => params[:program][:id].to_i)
      if !@cohort_program.nil?
        @cohort_program.each do |cp|
          @cohort_users = CohortUser.where(:cohort_program_id => cp.id)
          if !@cohort_users.nil?
            @cohort_users.each do |cu|
              @theses.push(Thesis.where(:user_id => User.find(cu.user_id)))
              @usuarios.push(User.find(cu.user_id))
            end
          end
        end
        respond_to do |format|
          format.json { render json: {theses:@theses,usuarios: @usuarios}}
        end
      end
    end
  end


  def set_project_presented
    @selected_programs = params[:programs]
    @array = []
    @selected_programs.each do |sp|
      @array.push(sp.to_i)
    end
    $programas = Program.where(id: @array)
    $project_program_counter = []
    $programas.each do |pro|
      @contador = 0
      @aprobado = false
      @cohort_program = CohortProgram.where(:program_id => pro.id)
      if @cohort_program.count != 0
        @cohort_program.each do |cp|
          @cohort_users = CohortUser.where(:cohort_program_id =>cp.id)
          if @cohort_users.count != 0
            @cohort_users.each do |cu|
              @user = User.find(cu.user_id)
              if !@user.project.nil?
                @contador = @contador+1
              end
            end
          end
        end
      end
      $project_program_counter.push(@contador)
    end
  end

  def set_thesis_teg_presented
    @selected_programs = params[:programs]
    @array = []
    @selected_programs.each do |sp|
      @array.push(sp.to_i)
    end
    $programas = Program.where(id: @array)
    $program_counter = []
    $programas.each do |pro|
      @contador = 0
      @cohort_program = CohortProgram.where(:program_id => pro.id)
      if @cohort_program.count != 0
        @cohort_program.each do |cp|
          @cohort_users = CohortUser.where(:cohort_program_id =>cp.id)
          if @cohort_users.count != 0
            @cohort_users.each do |cu|
              @user = User.find(cu.user_id)
              if !@user.project.nil?
                @thesis = Thesis.where(:project_id => @user.project.id)
                if !@thesis.nil?
                  if !ReviewThesis.where(:thesis_id => @thesis.ids).nil?
                    ReviewThesis.where(:thesis_id => @thesis.ids).each do |rt|
                      if rt.type_review_id == 1
                        @contador = @contador +1
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      $program_counter.push(@contador)
    end
  end


  def render_program_json
    @interested = Array.new
    $programas.each do |p|
      @interested.push(Interested.where(:program_id => p.id).count)
    end
    respond_to do |format|
      format.json { render json: {interesados: @interested, programas:$programas,contadores:$program_counter, contadores_project:$project_program_counter} }
    end


  end



  def index
    @programs = Program.all
    @users = User.all
    @polls = Poll.all
  end

  def line

  end

  def linexy
  end

  def scatter
  end

  def bar
  end

  def venn
  end

  def pie

  end

  def pie3d
  end

  def sparkline
  end

  def meter
  end

  def redir
    if params[:option] == "1"
      # redirect_to "/reportes/bar"
      redirect_to controller: 'reports', action: 'bar', programs: params[:programs]

    elsif params[:option] == "2"

      redirect_to controller: 'reports', action: 'pie', programs: params[:programs], encuestas: params[:encuestas]

    elsif params[:option] == "3"
      redirect_to "/reportes/line"

    elsif params[:option] == "4"
      redirect_to controller: 'reports', action: 'pie3d', encuesta: params[:encuesta].to_i
    elsif params[:option] == "5"
          redirect_to controller: 'reports', action: 'scatter', programs: params[:programs]

    end
  end
end
