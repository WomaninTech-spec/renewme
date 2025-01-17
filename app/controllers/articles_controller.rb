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
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      Activity.create!(
        description: "#{view_context.link_to current_user.username, user_path(current_user)} posted a new article: #{view_context.link_to @article.title, article_path(@article)} on ",
        user: current_user
      )
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(params[:article])
  end
  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy
    flash[:notice] = "You have successfully deleted this article."
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
