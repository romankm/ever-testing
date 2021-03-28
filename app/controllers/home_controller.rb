class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def assign_task
    task_type = assign_task_params

    begin
      TasksService::assign_task(current_user, task_type)
    rescue TasksService::NoTasksOfGivenTypeError => error
      flash[:alert] = error.message
    end

    redirect_to :root
  end

  def submit_answer

  end

  private

    def assign_task_params
      params.require(:task_type)
    end

    def submit_answer_params
      params.require(:task_id)
    end
end
