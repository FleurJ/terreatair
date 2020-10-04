class TagsController < ApplicationController
  before_action :find_tag, only: [:update, :edit, :destroy, :show]

  def show
    @contents = []
    contents = @tag.contents.sort_by(&:created_at).reverse!
    contents.each do |a|
      @contents << a if a.status == 'published'
    end
  end

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

    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
    authorize @tag
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    authorize @tag

    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title, :description)
  end
end
