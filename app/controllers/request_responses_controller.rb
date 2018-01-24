class RequestResponsesController < ApplicationController
  before_action :set_request_response, only: [:show, :edit, :update, :destroy]

  # GET /request_responses
  # GET /request_responses.json
  def index
    @request_responses = RequestResponse.all
  end

  # GET /request_responses/1
  # GET /request_responses/1.json
  def show
  end

  # GET /request_responses/new
  def new
    @request_response = RequestResponse.new
  end

  # GET /request_responses/1/edit
  def edit
  end

  # POST /request_responses
  # POST /request_responses.json
  def create
    @request_response = RequestResponse.new(request_response_params)

    respond_to do |format|
      if @request_response.save
        format.html { redirect_to @request_response }
        format.json { render action: 'show', status: :created, location: @request_response }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to @request_response }
        format.json { render json: @request_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_responses/1
  # PATCH/PUT /request_responses/1.json
  def update
    respond_to do |format|
      if @request_response.update(request_response_params)
        format.html { redirect_to @request_response}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_responses/1
  # DELETE /request_responses/1.json
  def destroy
    @request_response.destroy
    respond_to do |format|
      format.html { redirect_to request_responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_response
      @request_response = RequestResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_response_params
      params.require(:request_response).permit(:type_req_resp_id)
    end
end
