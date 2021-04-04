ActiveAdmin.register Answer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :task_id, :link, :attached_file
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :task_id, :link, :attached_file]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #
  index do
    selectable_column
    column 'User' do |answer|
      link_to answer.user.email, admin_user_path(answer.user)
    end
    column 'Task' do |answer|
      task_id = answer.task.id
      link_to "Task #{ task_id }", admin_task_path(task_id)
    end
    column 'Task type' do |answer|
      answer.task.task_type
    end
    column 'Link' do |answer|
      link_to("Link to repository", answer.link, target: '_blank') if answer.link.present?
    end
    # column :attached_file
    column :created_at
    actions
  end
end
