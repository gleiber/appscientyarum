class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

    def news_image

    @news = News.find(params[:id])
    @news.avatar = params[:avatar]
    respond_to do |format|
      if @news.save
        format.json { render json: @news }
      else
        format.json { render json: { errors: "Error al guardar" } }
      end
    end
  end

  def create_movil
    @news = News.new(news_params)
    puts @news
    respond_to do |format|
      if @news.save
        format.json { render json: @news , notice:"Noticia creada exitosamente"  }
      else
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /news/new
  def new
    @news = News.new
    @subjects = Subject.all
    @cohorts = Cohort.all
    @line_investigations = LineInvestigation.all
    @area_interests = AreaInterest.all
  end

  # GET /news/1/edit
  def edit
    @subjects = Subject.all
    @cohorts = Cohort.all
    @line_investigations = LineInvestigation.all
    @area_interests = AreaInterest.all
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    respond_to do |format|
      if params[:dirigido] == "1"
        @news.estado = "activo"
        if @news.save
          @users = User.all
          @users.each do |u|
            notificar(@news,u)
          end
          format.html { redirect_to '/news', notice: 'Noticia creada exitosamente'}
          format.json { render action: 'show', status: :created, location: @news }
        else
          @subjects = Subject.all
          @cohorts = Cohort.all
          @line_investigations = LineInvestigation.all
          @area_interests = AreaInterest.all
          format.html { render action: 'new' }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      elsif params[:dirigido] == "2"
        rol = Role.find_by(descripcion: 'Coordinador de Programa')
        @users = rol.users
        @users.each do |u|
          notificar(@news,u)
        end
      elsif params[:dirigido] == "3"
        rol = Role.find_by(descripcion: 'Profesor')
        @users = rol.users
        @users.each do |u|
          notificar(@news,u)
        end
      elsif params[:dirigido] == "4"
        rol = Role.find_by(descripcion: 'Participante')
        @users = rol.users
        @users.each do |u|
          notificar(@news,u)
        end
        format.html { redirect_to '/news', notice: 'Noticia creada exitosamente'}
        format.json { render action: 'show', status: :created, location: @news }
      elsif params[:dirigido] == "5"
          @cohort = Cohort.find(params[:cohort_id])
          @users = @cohort.users
          @users.each do |u|
            notificar(@news,u)
          end
      elsif params[:dirigido] == "6"
        @line_investigation = LineInvestigation.find(params[:line_investigation_id])
        @users = @line_investigation.users
        @users.each do |u|
          notificar(@news,u)
        end
      else
        @subjects = Subject.all
        @cohorts = Cohort.all
        @line_investigations = LineInvestigation.all
        @area_interests = AreaInterest.all
        format.html { render action: 'new', alert: "A quien va elegido" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
      #if @news.save
      #  format.html { redirect_to users_path, notice: 'Noticia creada exitosamente' }
      #  format.json { render action: 'show', status: :created, location: @news }
      #  @user = User.all
      #  if @user.length != 0
      #    if params[:dirigido] == "7"
      #      @selected_area_interests = AreaInterest.find(params[:area_interest_id])
      #      @users_per_area = @selected_area_interests.users
      #      if @users_per_area.count != 0
      #        @users_per_area.each do |u|
      #          notificar(@news,u)
      #        end
      #      end
      #    else if params[:dirigido] == "6"
      #           @selected_line_investigation = LineInvestigation.find(params[:line_investigation_id])
      #           @areas_interest = @selected_line_investigation.area_interests
      #           if @areas_interest.count != 0
      #             @areas_interest.each do |a|
      #               @users_per_area = a.users
      #               if @users_per_area.count != 0
      #                 @users_per_area.each do |u|
      #                   notificar(@news,u)
      #                 end
      #               end
      #             end
      #           end
      #         else if params[:dirigido] == "5"
      #                @subject = Subject.find(params[:subject_id])
      #                @user_subject = @subject.users
      #                if @user_subject.count != 0
      #                  @user_subject.each do |u|
      #                    notificar(@news,u)
      #                  end
      #                end
      #              end
      #         end
      #    @user.each do |usuario|
      #      if params[:dirigido] == "2" and usuario.role.descripcion.downcase.include? "coordinador"
      #        notificar(@news,usuario)
      #
      #      else if params[:dirigido] == "3" and usuario.role.descripcion.downcase == "profesor"
      #             notificar(@news,usuario)
      #           else if params[:dirigido] == "4" and usuario.role.descripcion.downcase == "participante"
      #                  notificar(@news,usuario)
      #
      #                end
      #           end
      #      end
      #
      #    end
      #
      #    end
      #  else
      #    format.html { render action: 'new' }
      #    format.json { render json: @news.errors, status: :unprocessable_entity }
      #  end
      #end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to users_path, notice: 'Noticia modificada exitosamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    if @news.estado == "activado"
      @news.update(estado: "desactivado")
    else
      @news.update(estado: "activado")
    end
    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:titulo, :descripcion, :avatar, :cohort_id, :dirigido, :line_investigation_id )
    end

  def notificar(news,usuario)
    notific = Notification.create(tittle: news.titulo,
                                  event: news.descripcion,
                                  viewed: FALSE,
                                  id_user: usuario.id,id_publisher: nil,
                                  url: $domain_url+"/notifications")

    publicar_notificacion(notific.tittle,"Hace un momento",current_user.nombre.to_s+"("+current_user.username.to_s+")", notific.id_user,
                          notific.event,Notification.where(:viewed => FALSE).where(:id_user => usuario.id).count)

  end

end

#avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at