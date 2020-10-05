class TagsController < ApplicationController
  before_action :find_tag, only: [:update, :edit, :destroy]

  def index
    @tags = policy_scope(Tag).all.sort_by(&:title)
  end

  def new
    @tag = Tag.new
    authorize @tag
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    authorize @tag
  end

  def edit
    authorize @tag
  end

  def update
    @tag.update(tag_params)
    authorize @tag
    redirect_to tags_path
  end

  def destroy
    @tag.destroy
    authorize @tag
    redirect_to tags_path
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title, :description)
  end
end
