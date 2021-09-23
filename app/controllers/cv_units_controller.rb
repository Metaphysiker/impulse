class CvUnitsController < ApplicationController
  before_action :set_cv_unit, only: %i[ show edit update destroy ]

  # GET /cv_units or /cv_units.json
  def index
    @cv_units = CvUnit.all
  end

  # GET /cv_units/1 or /cv_units/1.json
  def show
  end

  # GET /cv_units/new
  def new
    @cv_unit = CvUnit.new
  end

  # GET /cv_units/1/edit
  def edit
  end

  # POST /cv_units or /cv_units.json
  def create
    @cv_unit = CvUnit.new(cv_unit_params)

    respond_to do |format|
      if @cv_unit.save
        format.html { redirect_to @cv_unit, notice: "Eintrag wurde erstellt!" }
        format.json { render :show, status: :created, location: @cv_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cv_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cv_units/1 or /cv_units/1.json
  def update
    respond_to do |format|
      if @cv_unit.update(cv_unit_params)
        format.html { redirect_to cv_generator_update_cv_units_for_user_page_path(@cv_unit.user), notice: "Eintrag wurde aktualisiert!" }
        format.json { render :show, status: :ok, location: @cv_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cv_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cv_units/1 or /cv_units/1.json
  def destroy
    @cv_unit.destroy
    respond_to do |format|
      format.html { redirect_to cv_units_url, notice: "Eintrag wurde gelöscht!" }
      format.json { head :no_content }
    end
  end

  def create_cv_unit
    @cv_unit = CvUnit.new(cv_unit_params)
    @cv_unit.user_id = current_user.id
    @user = current_user
    @category = params[:cv_unit][:category]

    respond_to do |format|
      if @cv_unit.save
        format.html { redirect_to @cv_unit, notice: 'Eintrag wurde erstellt!' }
        format.json { render :show, status: :created, location: @cv_unit }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cv_unit.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def remove_cv_unit
    @cv_unit = CvUnit.find(params[:id])
    @category = @cv_unit.category
    @user = current_user
    @cv_unit.delete
  end

  def update_cv_unit
    @cv_unit = CvUnit.find(params[:id])
    @category = @cv_unit.category

    respond_to do |format|
      if @cv_unit.update(cv_unit_params)
        format.html { redirect_to @cv_unit, notice: 'Eintrag wurde aktualisiert!' }
        format.json { render :show, status: :created, location: @cv_unit }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cv_unit.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cv_unit
      @cv_unit = CvUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cv_unit_params
      params.require(:cv_unit).permit(:category, :name, :content, :start_date, :end_date, :location, :company, :job)
    end
end
