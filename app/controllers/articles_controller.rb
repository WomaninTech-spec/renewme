class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def create
    article = Article.create(article_params)
    redirect_to articles_path
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(params[:article])
  end
  def destroy
    @articles = Articles.find(params[:id])
    @articles.destroy
    flash[:notice] = "You have successfully deleted this article."
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :title, :content)
end
