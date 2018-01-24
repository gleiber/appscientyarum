class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end
  def encuesta_web
    @polls = Poll.all
    @poll = Poll.new
  end
  def agregar
    if params[:poll_id].present?
      polls = Poll.all
      polls.each do |p|
        p.update(estatus: 'desactivado')
      end
      poll = Poll.find(params[:poll_id])
      poll.update(estatus: 'activado')
      redirect_to '/encuesta_web', notice: 'Encuesta seleccionada'
    else
      redirect_to '/encuesta_web', alert: 'Seleccione una encuesta'
    end
  end
  def grafica_encuesta
    @poll = Poll.find(1)
    @survey_response = @poll.survey_responses

    prueba2 = SurveyResponseQuestion.joins(survey_response: [:poll]).group(:question_id, :answer_id).count()

    @prueba = SurveyResponseQuestion.find_by_sql("SELECT DISTINCT ON (survey_response_questions.id) survey_response_questions.* FROM survey_response_questions
INNER JOIN survey_responses ON survey_responses.id= survey_response_questions.survey_response_id
INNER JOIN polls ON '#{@poll.id}' = survey_responses.poll_id WHERE survey_response_questions.answer_id='2' AND survey_response_questions.question_id='3'")
    #@prueba.group(:question_id, :answer_id).count()

    @final1 = SurveyResponseQuestion.joins(:survey_response).where(["survey_responses.poll_id = ?", @poll.id])#.group(:question_id, :answer_id).count()
    @final = SurveyResponseQuestion.joins(:survey_response).where(["survey_responses.poll_id = ?", @poll.id])


@titulo_pregunta1= Array.new
@titulo_pregunta2= Array.new
@titulo_pregunta3= Array.new
@titulo_pregunta4= Array.new
@titulo_pregunta5= Array.new
@titulo_pregunta6= Array.new

@data_pregunta1= Array.new
@data_pregunta2= Array.new
@data_pregunta3= Array.new
@data_pregunta4= Array.new
@data_pregunta5= Array.new
@data_pregunta6= Array.new
i = 0
@poll.questions.each do |question|
  puts "pregunta "+question.descripcion
  asd = SurveyResponseQuestion.where(question_id: question.id).joins(:survey_response).where(["survey_responses.poll_id = ?", @poll.id]).group(:answer_id).count()
  puts "AQui Si es la misma data"
  puts "Este es el id de la respuesta"
  puts asd.first
  question.answers.each do |answer|
    n = SurveyResponseQuestion.find_by_sql("SELECT DISTINCT ON (survey_response_questions.id) survey_response_questions.* FROM survey_response_questions
                                      INNER JOIN survey_responses ON survey_responses.id= survey_response_questions.survey_response_id
                                      INNER JOIN polls ON '#{@poll.id}' = survey_responses.poll_id WHERE survey_response_questions.answer_id='#{answer.id}' 
                                      AND survey_response_questions.question_id='#{question.id}'").count()

    if i==0
      @titulo_pregunta1.push answer.descripcion
      @data_pregunta1.push n
    elsif i==1
      @titulo_pregunta2.push answer.descripcion
      @data_pregunta2.push n
    elsif i==2
      @titulo_pregunta3.push answer.descripcion
      @data_pregunta3.push n
    elsif i==3
      @titulo_pregunta4.push answer.descripcion
      @data_pregunta4.push n
    elsif i==4
      @titulo_pregunta5.push answer.descripcion
      @data_pregunta5.push n
    elsif i==5
      @titulo_pregunta6.push answer.descripcion
      @data_pregunta6.push n
    end
  end
  i= i+1
end
  @pastel1=Gchart.pie(

                    :size   => '600x400',
                    :title  => "Grafica de Pastel- Navegadores mas usados",
                    :legend => @titulo_pregunta1,
                    :custom => "chco=FFF110,FF0000",
                    :data   => @data_pregunta1)
  @pastel2=Gchart.pie(

                    :size   => '600x400',
                    :title  => "Grafica de Pastel- Navegadores mas usados",
                    :legend => @titulo_pregunta2,
                    :custom => "chco=FFF110,FF0000",
                    :data   => @data_pregunta2)
  @pastel3=Gchart.pie(

                    :size   => '600x400',
                    :title  => "Grafica de Pastel- Navegadores mas usados",
                    :legend => @titulo_pregunta3,
                    :custom => "chco=FFF110,FF0000",
                    :data   => @data_pregunta3)
  @pastel4=Gchart.pie(

                    :size   => '600x400',
                    :title  => "Grafica de Pastel- Navegadores mas usados",
                    :legend => @titulo_pregunta4,
                    :custom => "chco=FFF110,FF0000",
                    :data   => @data_pregunta4)


  end

  def llenar_encuesta
    @poll = Poll.find(params[:id])
    if !@poll.nil?
      @question_poll = QuestionPoll.where(:poll_id => @poll.id)
      if @question_poll.count > 0
        @questions = @poll.questions
      end
    end
  end

  def guardar_encuesta_llenada
    @poll = Poll.find(params[:id])
    if !@poll.nil?
      @question_poll = QuestionPoll.where(:poll_id => @poll.id)
      if @question_poll.count > 0
        @questions = @poll.questions
      end
    end
    @survey_response = SurveyResponse.new
    @survey_response.poll_id = @poll.id
    if current_user.nil?
    @survey_response.sexo = "Masculino" #ver como se llena esto
    else
      @survey_response.sexo = current_user.sexo
    end
      #ver como se llena esto
      @survey_response.edad = 20
      respond_to do |format|
        if @survey_response.save
          #guardo ahora las preguntas por las respuestas
          @questions.each do |q|
            @sqr = SurveyResponseQuestion.new
            @sqr.survey_response_id = @survey_response.id
            @sqr.question_id = q.id
            @sqr.answer_id = params[q.id.to_s].to_i
            @sqr.save
          end
          format.html { redirect_to "/"}
        else
          #No se guardo bien
        end
      end

end
  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
    @type_polls = TypePoll.all
    @questions = Question.all
  end

  # GET /polls/1/edit
  def edit
    @type_polls = TypePoll.all
    @questions = Question.all
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)
    @poll.type_poll_id = params[:type_poll_id].to_i
    @questions= params[:questions]

    respond_to do |format|
      if @poll.save
        @questions.each do |question_id|
          QuestionPoll.create(poll_id: @poll.id, question_id: question_id)
        end
          if TypePollRole.where(:type_poll_id => @poll.type_poll).count > 0
            TypePollRole.where(:type_poll_id => @poll.type_poll).each do |tpr|
              if User.where(:role_id => tpr.role_id).count > 0
                User.where(:role_id => tpr.role_id).each do |u|
                  NewPollMailer.sample_email(@poll,u).deliver_now
                end
              end
            end
          end


        format.html { redirect_to '/polls' , notice:"Encuesta creada exitosamente" }
        format.json { render action: 'show', status: :created, location: @poll }
      else
        format.html { render action: 'new' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update

    @poll.type_poll_id = params[:type_poll_id]
    respond_to do |format|

      if @poll.update(descripcion: poll_params[:descripcion], type_poll_id: params[:type_poll_id])
        @questions= params[:questions]
        if (@questions)
          @question_polls = QuestionPoll.where(poll_id: @poll.id)
          @question_polls.each do |question_poll|
            question_poll.destroy
          end
          @questions.each do |question_id|
            QuestionPoll.create(poll_id: @poll.id, question_id: question_id)
          end
        else
          @collections = Collection.all
          format.html { render '/postulates/chequeo', notice: 'Debe seleccionar por lo menos un recaudo' }
        end
        format.html { redirect_to '/polls' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end

    end

  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:descripcion, :type_poll_id)
    end
end
