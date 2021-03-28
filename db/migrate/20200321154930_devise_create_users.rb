# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # App specific
      t.string :user_level, null: false, default: UserLevel::JUNIOR
      t.references :technical_task, null: true, foreign_key: { to_table: :tasks }
      t.references :english_task, null: true, foreign_key: { to_table: :tasks }

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    User.create! do |u|
      u.email      = 'u@test.com'
      u.password   = 'password'
    end
  end
end
