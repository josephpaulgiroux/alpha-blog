class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end 
  
  def edit
    @article = Article.find(params[:id])
  end 
  
  
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    
    if @article.save
      flash[:notice]  = "Article was created successfully."
      # :notice or :alert (when something goes wrong)
      redirect_to @article
    else 
      render 'new'
    end
    # redirect_to article_path(@article)
    # render plain: @article.inspect
    # render plain: params[:article]
  end
  
  
  def update 
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else 
      render 'edit'    
    end 
  end 
  
end