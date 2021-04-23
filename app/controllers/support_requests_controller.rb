class SupportRequestsController < ApplicationController
  before_action :set_support_request, only: %i[ show edit update destroy ]

  # GET /support_requests or /support_requests.json
  def index
    @support_requests = SupportRequest.all
  end

  # GET /support_requests/1 or /support_requests/1.json
  def show
  end

  # GET /support_requests/new
  def new
    @support_request = SupportRequest.new
  end

  # GET /support_requests/1/edit
  def edit
  end

  # POST /support_requests or /support_requests.json
  def create
    @support_request = SupportRequest.new(support_request_params)

    respond_to do |format|
      if @support_request.save
        format.html { redirect_to @support_request, notice: "Call for Help wurde erstellt!" }
        format.json { render :show, status: :created, location: @support_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_requests/1 or /support_requests/1.json
  def update
    respond_to do |format|
      if @support_request.update(support_request_params)
        format.html { redirect_to @support_request, notice: "Call for Help wurde aktualisiert!" }
        format.json { render :show, status: :ok, location: @support_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_requests/1 or /support_requests/1.json
  def destroy
    @support_request.destroy
    respond_to do |format|
      format.html { redirect_to support_requests_url, notice: "Call for Help wurde entfernt!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_request_params
      params.require(:support_request).permit(:title, :content, :expertise_ids => [])
    end
end
