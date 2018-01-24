class PostulateCollectionsController < ApplicationController
  before_action :set_postulate_collection, only: [:show, :edit, :update, :destroy]

  # GET /postulate_collections
  # GET /postulate_collections.json
  def index
    @postulate_collections = PostulateCollection.all
  end

  # GET /postulate_collections/1
  # GET /postulate_collections/1.json
  def show
  end

  # GET /postulate_collections/new
  def new
    @postulate_collection = PostulateCollection.new
  end

  # GET /postulate_collections/1/edit
  def edit
  end

  # POST /postulate_collections
  # POST /postulate_collections.json
  def create
    @postulate_collection = PostulateCollection.new(postulate_collection_params)

    respond_to do |format|
      if @postulate_collection.save
        format.html { redirect_to @postulate_collection }
        format.json { render action: 'show', status: :created, location: @postulate_collection }
      else
        format.html { render action: 'new' }
        format.json { render json: @postulate_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulate_collections/1
  # PATCH/PUT /postulate_collections/1.json
  def update
    respond_to do |format|
      if @postulate_collection.update(postulate_collection_params)
        format.html { redirect_to @postulate_collection }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @postulate_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulate_collections/1
  # DELETE /postulate_collections/1.json
  def destroy
    @postulate_collection.destroy
    respond_to do |format|
      format.html { redirect_to postulate_collections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulate_collection
      @postulate_collection = PostulateCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulate_collection_params
      params.require(:postulate_collection).permit(:postulate_id, :collection_id)
    end
end
