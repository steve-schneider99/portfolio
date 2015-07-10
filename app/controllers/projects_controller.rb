class ProjectsController < ApplicationController
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
    if current_user == nil || current_user.email != "steve.schneider99@gmail.com"
      flash[:alert] = "Not authorized! Please sign in!"
      redirect_to skills_path
    end
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project has been added!"
      redirect_to skill_path(@project.skill)
    else
      flash[:alert] = "Errors detected!"
      render :new
    end
  end

  def show
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    if current_user == nil || current_user.email != "steve.schneider99@gmail.com"
      flash[:alert] = "Not authorized! Please sign in!"
      redirect_to skills_path
    end
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project has been updated!"
      redirect_to skill_project_path
    else
      flash[:alert] = "Errors detected!"
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to skill_path
  end

private
  def project_params
    params.require(:project).permit(:name, :description, :url)
  end

end
