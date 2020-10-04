class ContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def show
    @content = Content.friendly.find(params[:id])
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

    redirect_to content_path(@content)
  end

  def edit
    @content = Content.find(params[:id])
    authorize @content
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    authorize @content
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.friendly.find(params[:id])
    @content.destroy
    authorize @content
    redirect_to root_path
  end

  def index
    @contents = policy_scope(Content).where(status: "published").order(:order)
  end

  def admin
    @content = Content.all.order(:order)

    authorize @content
  end

  private

  def content_params
    params.require(:content).permit(:title, :status, :teaser, :body, :links, :image, :image800x800, :order)
  end
end
