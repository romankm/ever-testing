class HomeController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def assign_task
    # puts params
    task_type = assign_task_params
    TasksService::assign_task(current_user, task_type)

    redirect_to 'index'
  end

  private

  def assign_task_params
    params.require(:task_type)
  end
end
