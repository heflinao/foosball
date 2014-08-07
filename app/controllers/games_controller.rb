class GamesController < ApplicationController

	def index
		@opponent = User.find_by(params[:opponent])
		@games = if current_user
								Game.all
							end
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.create(game_params)
		@game.me = current_user.id
		if @game.save
			redirect_to @game
		else
			render "new"
		end
	end

	def show
		@game = Game.find(params[:id])
		@me = User.find_by(params[:me])
		@opponent = User.find_by(params[:opponent])
	end

	private
	
	def game_params
		if params[:commit] == 'Save'
			params.require(:game).permit(:me, :opponent, :my_score, :opponent_score)
		end
	end
end
