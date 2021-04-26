class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end 
  
  def edit
  end 
  
  
  def create
    @article = Article.new(article_params)
    @article.user = User.first
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
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else 
      render 'edit'    
    end 
  end 
  
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end 
  
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end 
  
  def article_params
    params.require(:article).permit(:title, :description)
  end 
  
  
end