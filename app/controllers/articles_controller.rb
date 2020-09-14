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
    @article = Article.create(params.require(:article).permit(:title, :content))
    if @article.persisted?
      redirect_to article_path(@article), notice: 'Article was successfully created.'
    else
      redirect_to new_article_path, notice: "Field can't be blank"
    end
  end

  def edit
    @article = Article.find(params[:id]) 
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(params.require(:article).permit(:title, :content))
      redirect_to @article, notice: 'ok'
    else
      render 'edit', notice: 'xd'
    end
  end
   
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
