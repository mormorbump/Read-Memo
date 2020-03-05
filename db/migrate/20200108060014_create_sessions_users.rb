# frozen_string_literal: true

class CreateSessionsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions_users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image

      t.timestamps
    end
  end
end
