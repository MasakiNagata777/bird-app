class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :name
      t.integer :health
      t.string :growth_stage

      t.timestamps
    end
  end
end
