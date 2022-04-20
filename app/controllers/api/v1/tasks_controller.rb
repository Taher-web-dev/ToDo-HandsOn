module Api
  module V1
    class TasksController < ApplicationController
      def index
        @tasks = Task.all
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: @tasks}, status: :ok
      end
    end
  end
end