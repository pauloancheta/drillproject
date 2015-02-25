class TagsController < ApplicationController

  before_action :authenticate_user!
  # Get the tag instance before running the listed actions
  before_action :get_tag

  def show
  end

  private

  def get_tag
    @tag = Tag.find params[:id]
  end

end
