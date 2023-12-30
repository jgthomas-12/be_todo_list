class Api::V1::TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: TaskSerializer.new(tasks)
  end

  def create
    new_task = Task.new(new_task_params)

    if new_task.save
      render json: { success: "Task added successfully" }, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: { success: "Task deleted successfully"}
  end

  def update
    task = Task.find(params[:id])
    task.update(new_task_params)
    render json: { success: "Task updated successfully"}, status: :ok
  end

  private

  def new_task_params
    params.permit(:name, :description, :completed)
  end
end