class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :userid
      t.date :date
      t.integer :percentage

      t.timestamps
    end
  end
end
