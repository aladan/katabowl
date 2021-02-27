class GamesController < ApplicationController
    def create
        @game = Game.new(game_params)
        @game.save
        redirect_to root_path
    end

    def index
        @games = Game.order(:created_at)
        @game = Game.new
    end

    def destroy
        Game.find(params[:id]).destroy
        redirect_to root_path
    end

    private

    def game_params
        params.require(:game).permit(:line)
    end
end
