class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_task_path
    else
      render :edit
    end
  end



  private

  def task_params
    params.require(:task).permit(:start_time, :title, :content, :task_type_id, :notice_id).merge(user_id: current_user.id)
  end



end
