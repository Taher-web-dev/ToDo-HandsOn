module Api
  module V1
    class TasksController < ApplicationController
      def index
        @tasks = Task.all
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: @tasks}, status: :ok
      end

      def update
        @task = Task.find(params[:id])
        if @task.update(params_update)
          render json: {status: 'SUCCESS', message:'Task is updated', data:@task}, status: :ok
        else
          render json: {status: 'Error', message: 'Something went wrong!', data:@task.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @task = Task.find(params[:id])
        if @task.destroy
          render json: {status: 'SUCCESS', message:'Task deleted successfully', data:@task}, status: :ok
        else
          render json: {status: 'Error', message: 'Something went wrong!', data:@task}, status: :unprocessable_entity
        end
      end

      def create
        @task = Task.new
        if @task.create
          render json: {status: 'SUCCESS', message:'Task created successfully', data:@task}, status: :ok
        else
          render json: {status: 'Error', message:"Something went wrong, Task doesn't created!", data:@task}, status: :unprocessable_entity
      end

      private 
      def params_update
        params.require(:task).permit(:description, :done)
      end

      def params_create
        params.require(:task).permit(:description, :day)
      end
    end
  end
end