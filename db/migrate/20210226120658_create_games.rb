class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :line
      t.integer :total_score

      t.timestamps
    end
  end
end
