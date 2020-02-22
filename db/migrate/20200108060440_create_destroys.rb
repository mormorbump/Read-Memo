class CreateDestroys < ActiveRecord::Migration[6.0]
  def change
    create_table :destroys do |t|
      drop_table :sessionusers
      t.timestamps
    end
  end
end
