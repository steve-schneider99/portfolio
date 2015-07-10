class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    @blogs = Blog.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
    if current_user == nil || current_user.email != "steve.schneider99@gmail.com"
      flash[:alert] = "Not authorized!"
      redirect_to skills_path
    end

  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "Skill has been added!"
      redirect_to skills_path
    else
      flash[:alert] = "Errors detected!"
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    if current_user == nil || current_user.email != "steve.schneider99@gmail.com"
      flash[:alert] = "Not authorized!"
      redirect_to skills_path
    end
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill has been updated!"

      redirect_to skill_path
    else
      flash[:alert] = "Errors detected!"
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end




private
  def skill_params
    params.require(:skill).permit(:name, :description, :timestamp)
  end

end
