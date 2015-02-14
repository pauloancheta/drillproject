class TagsController < ApplicationController

  # Get the tag instance before running the listed actions
  before_action :get_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.order(title: :asc)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to @tag
    else
      flash[:alert] = get_errors
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tag.update tag_params
      redirect_to @tag
    else
      flash[:alert] = get_errors
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      redirect_to tags_path
    else
      flash[:alert] = get_errors
      redirect_to @tag
    end
  end

  private

  def get_tag
    @tag = Tag.find params[:id]
  end

  def tag_params
    params.require(:tag).permit(:title)
  end

  def get_errors
    @tag.errors.full_messages.join('; ')
  end

end
