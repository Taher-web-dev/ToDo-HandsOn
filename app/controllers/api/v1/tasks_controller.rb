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
          render json: {status: 'Error', message: 'Something went wrong!', data:@task}, status: :ok
        end
      end

      private 
      def params_update
        params.require(:task).permit(:description, :done)
      end
    end
  end
end