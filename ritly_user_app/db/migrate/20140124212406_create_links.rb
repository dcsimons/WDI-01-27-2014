class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :full_url
      t.string :ritly_url
      t.integer :visits

      t.timestamps
    end
  end
end
