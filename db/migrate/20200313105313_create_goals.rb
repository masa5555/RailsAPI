class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :userid
      t.date :dealline
      t.string :content

      t.timestamps
    end
  end
end
