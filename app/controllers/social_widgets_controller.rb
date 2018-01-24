class SocialWidgetsController < ApplicationController
  before_action :set_social_widget, only: [:show, :edit, :update, :destroy]

  # GET /social_widgets
  # GET /social_widgets.json
  def index
    @social_widgets = SocialWidget.all
  end

  # GET /social_widgets/1
  # GET /social_widgets/1.json
  def show
  end

  # GET /social_widgets/new
  def new
    @social_widget = SocialWidget.new
  end

  # GET /social_widgets/1/edit
  def edit
  end

  # POST /social_widgets
  # POST /social_widgets.json
  def create
    @social_widget = SocialWidget.new(social_widget_params)

    respond_to do |format|
      if @social_widget.save
        format.html { redirect_to "/social_widgets"}
        format.json { render :show, status: :created, location: @social_widget }
      else
        format.html { render :new }
        format.json { render json: @social_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_widgets/1
  # PATCH/PUT /social_widgets/1.json
  def update
    respond_to do |format|
      if @social_widget.update(social_widget_params)
        format.html { redirect_to "/social_widgets" }
        format.json { render :show, status: :ok, location: @social_widget }
      else
        format.html { render :edit }
        format.json { render json: @social_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_widgets/1
  # DELETE /social_widgets/1.json
  def destroy
    @social_widget.destroy
    respond_to do |format|
      format.html { redirect_to social_widgets_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_widget
      @social_widget = SocialWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_widget_params
      params.require(:social_widget).permit(:facebook, :twitter, :instagram, :linkedin)
    end
end
