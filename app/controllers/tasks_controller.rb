class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root_path_only_index, only: [:index]
  before_action :task_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_tasks_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to user_task_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to user_tasks_path(@task.user_id)
  end




  private

  def task_params
    params.require(:task).permit(:start_time, :title, :content, :task_type_id, :notice_id).merge(user_id: current_user.id)
  end

  def move_to_root_path_only_index
    redirect_to root_path unless current_user.id == params[:user_id].to_i
  end

  def move_to_root_path
    redirect_to root_path unless current_user == @task.user
  end


end
