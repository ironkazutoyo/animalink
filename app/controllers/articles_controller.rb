class ArticlesController < ApplicationController

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

  private

  def article_params
    params.require(:article).permit(:image, :title, :text, :pet_type_id, :text_type_id, :publishing_setting_id).merge(user_id: current_user.id)
  end

end
