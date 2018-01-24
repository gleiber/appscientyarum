class TypeReviewsController < ApplicationController
  before_action :set_type_review, only: [:show, :edit, :update, :destroy]

  # GET /type_reviews
  # GET /type_reviews.json
  def index
    @type_reviews = TypeReview.all
  end

  # GET /type_reviews/1
  # GET /type_reviews/1.json
  def show
  end

  # GET /type_reviews/new
  def new
    @type_review = TypeReview.new
  end

  # GET /type_reviews/1/edit
  def edit
  end

  # POST /type_reviews
  # POST /type_reviews.json
  def create
    @type_review = TypeReview.new(type_review_params)

    respond_to do |format|
      if @type_review.save
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Revision&tabla=TypeReview' }
        format.json { render action: 'show', status: :created, location: @type_review }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Revision&tabla=TypeReview' }
        format.json { render json: @type_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_reviews/1
  # PATCH/PUT /type_reviews/1.json
  def update
    respond_to do |format|
      if @type_review.update(type_review_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Revision&tabla=TypeReview' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_reviews/1
  # DELETE /type_reviews/1.json
  def destroy
    @type_review.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Tipo+de+Revision&tabla=TypeReview' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_review
      @type_review = TypeReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_review_params
      params.require(:type_review).permit(:descripcion)
    end
end
