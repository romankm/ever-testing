class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      # t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.string :link
      t.string :attachment

      t.timestamps
    end
  end
end
