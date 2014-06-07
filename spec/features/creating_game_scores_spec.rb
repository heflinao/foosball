require 'spec_helper'

feature 'Creating Game Scores' do
	scenario 'with valid scores'
		visit scores_path
		click_link 'New Game'
	end
