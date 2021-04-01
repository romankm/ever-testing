ActiveAdmin.register Task do
  permit_params :body, :attachment, :user_level, :task_type

  form title: 'New task' do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Task' do
      f.input :body, required: false
      f.input :attachment, as: :file, required: false
      f.input :task_type,  collection: Task.task_types.values, as: :radio,  required: true
      f.input :user_level, collection: UserLevel::all,         as: :select, required: true
    end

    f.actions
  end

  action_item only: [:show] do
    link_to('Download File', download_task_path(resource)) if resource.upload_file.present?
  end

  member_action :download, method: :get do
    task = Task.find(params[:id])
    send_file task.attachment
  end

  # show do
  #   render 'show', { task: task }
  # end
end
