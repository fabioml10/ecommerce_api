module Admin::V1
  class GamesController < ApiController
    before_action :set_game, only: [:update, :destroy]

    def index
      @games = Game.all
    end

    def create
      @game = Game.new(game_params)
      save_game!
    end

    def update
      @game.attributes = game_params
      save_game!
    end

    def destroy
      @game.destroy!
    rescue
      render_error(fields: @game.errors.message)
    end

    private
      def game_params
        return {} unless params.has_key?(:game)
        params.require(:game).permit(:mode, :release_date, :developer, :system_requirement_id)
      end

      def set_game
        @game = Game.find(params[:id])
      end

      def save_game!
        @game.save!
        render :show
      rescue
        render_error(fields: @game.errors.messages)
      end
  end
end
