class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :article_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]


  def index
    if user_signed_in?
     @user = current_user.id
    end
    @articles = Article.all
    @tasks = Task.all.order('task_type_id ASC')
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

  end

  def edit
  end

  def update
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

  def notice
    task = Task.find(params[:id])
    task.increment!(:notice_id, 1)

    notice = Task.find(params[:id])
    render json:{ task: notice }

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
