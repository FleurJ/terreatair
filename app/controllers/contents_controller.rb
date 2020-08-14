class ContentsController < ApplicationController
  def show
  end

  def index
    @contents = Content.all.sort_by(&:created_at).reverse!
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content.params)
    @content.save
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
    redirect_to tags_path
  end

  private

  def content_params
    params.require(:content).permit(:title, :status, :teaser, :body, :links)
  end
end
