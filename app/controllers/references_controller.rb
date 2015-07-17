class ReferencesController < ApplicationController
  def index
    @references = Reference.all
    @reference = Reference.new

  end

  def create
    @reference = current_user.references.new(reference_params)
    if @reference.save
      respond_to do |format|
        format.html { redirect_to skills_path }
        format.js
      end
    else
      flash[:alert] = "Error posting reference - try again."
      render :index
    end
  end

private
  def reference_params
    params.require(:reference).permit(:comment, :relation, :user_id)
  end

end
