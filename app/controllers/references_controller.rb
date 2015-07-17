class ReferencesController < ApplicationController
  def index
    @references = Reference.all
  end

  def create
    @reference = Reference.create(reference_params)
    respond_to do |format|
      format.html { redirect_to skills_path }
      format.js
    end
  end

  def new
    @reference = Reference.new
  end

private
  def reference_params
    params.require(:reference).permit(:comment, :relation, :user_id)
  end

end
