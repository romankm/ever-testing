ActiveAdmin.register User do
  # actions :all, except: [:edit]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  menu label: 'Invited Users'
  permit_params :email, :user_level, :password #, :reset_password_token, :encrypted_password

  form title: 'Create invite' do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'User credentials ' do
      f.input :email, required: true
      f.input :password, required: true
      f.input :user_level, collection: UserLevel::all, as: :select, required: true
    end

    f.actions
  end

  index do
    selectable_column
    column :email
    column :user_level

    column 'English task' do |user|
      link_to 'English task ' + user.english_task.id.to_s, admin_task_path(user.english_task) if user.english_task.present?
    end

    column 'Technical task' do |user|
      link_to 'Technical task ' + user.technical_task.id.to_s, admin_task_path(user.technical_task) if user.technical_task.present?
    end

    column :created_at

    actions
  end

  # # In app/admin/users.rb
  # action_item only: [:show] do
  #   link_to('Download File', download_admin_user_path(resource)) if resource.upload_file.present?
  # end

  # member_action :download, method: :get do
  #   user = User.find(params[:id])
  #   send_file user.upload_file
  # end

end
