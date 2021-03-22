class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :body
      t.string :attachment
      t.string :task_type
      t.string :user_level, null: false, default: UserLevel::JUNIOR

      t.timestamps
    end
  end
end
