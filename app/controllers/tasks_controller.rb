class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :toggle_completion]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      flash.now[:alert] = 'Error creating task.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      flash.now[:alert] = 'Error updating task.'
      render :edit
    end
  end
  def destroy
    @task.destroy
    redirect_to tasks_path, alert: 'Task was successfully deleted.'
  end

  def toggle_completion
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    respond_to do |format|
      format.js
      format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
