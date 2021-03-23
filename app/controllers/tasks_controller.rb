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
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:start_time, :title, :content, :task_type_id, :notice_id).merge(user_id: current_user.id)
  end



end
