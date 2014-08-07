class Game < ActiveRecord::Base
	validates :me, presence: true
	validates :opponent, presence: true
	validates :my_score, presence: true
	validates :opponent_score, presence: true

	belongs_to :user
end
