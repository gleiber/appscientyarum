class TypeNewsController < ApplicationController
  before_action :set_type_news, only: [:show, :edit, :update, :destroy]

  # GET /type_news
  # GET /type_news.json
  def index
    @type_news = TypeNews.all
  end

  # GET /type_news/1
  # GET /type_news/1.json
  def show
  end

  # GET /type_news/new
  def new
    @type_news = TypeNews.new
  end

  # GET /type_news/1/edit
  def edit
  end

  # POST /type_news
  # POST /type_news.json
  def create
    @type_news = TypeNews.new(type_news_params)

    respond_to do |format|
      if @type_news.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Noticia&tabla=TypeNews' }
        format.json { render action: 'show', status: :created, location: @type_news }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_news/1
  # PATCH/PUT /type_news/1.json
  def update
    respond_to do |format|
      if @type_news.update(type_news_params)
        format.html { redirect_to @type_news }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_news/1
  # DELETE /type_news/1.json
  def destroy
    @type_news.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Noticia&tabla=TypeNews' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_news
      @type_news = TypeNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_news_params
      params.require(:type_news).permit(:descripcion)
    end
end
