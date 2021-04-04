class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :body
      t.string :attached_file
      t.string :task_type, null: false, default: 'technical'
      t.string :user_level, null: false, default: UserLevel::JUNIOR

      t.timestamps
    end
  end
end
