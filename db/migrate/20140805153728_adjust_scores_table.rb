class AdjustScoresTable < ActiveRecord::Migration
  def change
		change_table :scores do |t|
			t.rename :score, :my_score
			t.integer :opponent_score
		end
		rename_table :scores, :games
  end
end
