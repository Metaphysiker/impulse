class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_skill
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id
    @user = current_user
    @category = params[:skill][:category]

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
        format.js
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def remove_skill
    @skill = Skill.find(params[:id])
    @category = @skill.category
    @user = current_user
    @skill.delete
  end

  def search_skill
    search_term = params[:search_skill][:search_term]
    skills = Skill.ilike("%#{search_term}%")
    user_ids = skills.pluck(:user_id)
    @users = User.where(id: user_ids)

    #plucked_ids = User.includes(:skills).where.not(skills: {id: nil}).pluck(:id)
    #plucked_ids.unshift(current_user.id) unless current_user.blank?
    #plucked_ids.uniq!
    #exchange_participants = User.where(id: plucked_ids).sort_by {|m| plucked_ids.index(m.id)}
    #byebug
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:title, :category)
    end
end
