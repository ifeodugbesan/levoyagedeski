class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article created!"
      redirect_to article_path(@article)
    else
      render :new
    end
    authorize @article
  end

  def edit
    authorize @article
  end

  def update
    @article.update!(article_params)
    redirect_to article_path(@article)
    authorize @article
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article deleted!"
    redirect_to articles_path
    authorize @article
  end

  private

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :preview_text, :content)
  end
end
