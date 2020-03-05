# frozen_string_literal: true

class AddRateToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rate, :float
  end
end
