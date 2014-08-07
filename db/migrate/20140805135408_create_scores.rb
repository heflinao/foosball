class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
			t.integer :me
			t.integer :opponent
			t.integer :score
			t.timestamp
    end
  end
end
