class ContentsController < ApplicationController
  def show
    @content = Content.friendly.find(params[:id])
    authorize @content
  end

  def index
    @contents = Content.all.sort_by(&:created_at).reverse!
    authorize @content
  end

  def new
    @content = Content.new
    authorize @content
  end

  def create
    @content = Content.new(content_params)
    @content.user = current_user
    @content.save
    authorize @content

    redirect_to content_path
  end

  def edit
  end

  def update
    @content.update(content_params)
    redirect_to content_path
  end

  def destroy
    @content.destroy
  end

  private

  def content_params
    params.require(:content).permit(:title, :status, :teaser, :body, :links, :image, :tags)
  end
end
