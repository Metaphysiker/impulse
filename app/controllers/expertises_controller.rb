class ExpertisesController < ApplicationController
  before_action :set_expertise, only: %i[ show edit update destroy ]

  # GET /expertises or /expertises.json
  def index
    @expertises = Expertise.all
  end

  # GET /expertises/1 or /expertises/1.json
  def show
  end

  # GET /expertises/new
  def new
    @expertise = Expertise.new
  end

  # GET /expertises/1/edit
  def edit
  end

  # POST /expertises or /expertises.json
  def create
    @expertise = Expertise.new(expertise_params)

    respond_to do |format|
      if @expertise.save
        format.html { redirect_to @expertise, notice: "Expertise was successfully created." }
        format.json { render :show, status: :created, location: @expertise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expertises/1 or /expertises/1.json
  def update
    respond_to do |format|
      if @expertise.update(expertise_params)
        format.html { redirect_to @expertise, notice: "Expertise was successfully updated." }
        format.json { render :show, status: :ok, location: @expertise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expertises/1 or /expertises/1.json
  def destroy
    @expertise.destroy
    respond_to do |format|
      format.html { redirect_to expertises_url, notice: "Expertise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expertise
      @expertise = Expertise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expertise_params
      params.require(:expertise).permit(:title, :description, :content)
    end
end
