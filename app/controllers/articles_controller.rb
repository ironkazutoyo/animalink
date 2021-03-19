class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :article_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]


  def index
    if user_signed_in?
     @user = current_user.id
    end
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :text, :pet_type_id, :text_type_id, :publishing_setting_id).merge(user_id: current_user.id)
  end

  def article_find
    @article = Article.find(params[:id])
  end

  def move_to_root_path
    redirect_to root_path unless current_user == @article.user
  end

end
