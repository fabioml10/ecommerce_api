require 'rails_helper'

RSpec.describe "Admin::V1::Games as :admin", type: :request do
  let(:user) { create(:user) }

  context "GET /games" do
    let(:url) { "/admin/v1/games"}
    let!(:games) { create_list(:game, 5) }

    it "returns all games" do
      get url, headers: auth_header(user)
      expect(body_json["games"]).to contain_exactly *games.as_json(only: %i[id mode release_date developer system_requirement_id])
    end

    it "returns success status" do
      get url, headers: auth_header(user)      
      expect(response).to have_http_status(:ok)
    end
  end

  context "POST /games" do
    let(:url) { "/admin/v1/games" }
  
    context "with valid params" do
      let(:game_params) { { game: attributes_for(:game) }.to_json }

      it "add new game" do
        expect do
          post url, headers: auth_header(user), params: game_params
        end.to change(Game, :count).by(1)
      end

      it "returns last added game" do
        post url, headers: auth_header(user), params: game_params
        expected_game = Game.last.as_json(only: %i(id mode release_date developer system_requirement_id))
        expect(body_json["game"]).to eq expected_game
      end

      it "returns success status" do
        post url, headers: auth_header(user), params: game_params
        expect(response).to have_http_status(:ok)
      end
    end
  
    context "with invalid params" do
      let(:game_invalid_params) do
        {game: attributes_for(:game, mode: nil)}.to_json
      end

      it "does not add a new game" do
        expect do
          post url, headers: auth_header(user), params: game_invalid_params
        end.to_not change(Game, :count)
      end

      it "returns error message" do
        post url, headers: auth_header(user), params: game_invalid_params
        expect(body_json['errors']['fields']).to have_key('mode')
      end

      it "return unprocessable entity status" do
        post url, headers: auth_header(user), params: game_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context "PATCH /games" do
    let!(:game) { create(:game) }
    let(:url) { "/admin/v1/games/#{game.id}"}

    context "with valid params" do
      let!(:new_mode) { "pvp" }
      let(:game_params) { { game: { mode: new_mode } }.to_json }

      it "updates game" do
        patch url, headers: auth_header(user), params: game_params
        game.reload
        expect(game.mode).to eq new_mode
      end

      it "returns updated game" do
        patch url, headers: auth_header(user), params: game_params
        game.reload
        expected_game = game.as_json(only: %i[id mode release_date developer system_requirement_id])
        expect(body_json["game"]).to eq expected_game
      end

      it "returns success status" do
        patch url, headers: auth_header(user), params: game_params
        expect(response).to have_http_status(:ok)
      end

    end

    context "with invalid params" do
      let(:game_invalid_params) do
        {game: attributes_for(:game, mode: nil)}.to_json
      end

      it "updates game" do
        old_mode = game.mode
        patch url, headers: auth_header(user), params: game_invalid_params
        game.reload
        expect(game.mode).to eq old_mode
      end

      it "returns error message" do
        patch url, headers: auth_header(user), params: game_invalid_params
        expect(body_json['errors']['fields']).to have_key('mode')
      end

      it "returns unprocessable entity status" do
        patch url, headers: auth_header(user), params: game_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  context "DELETE /games" do
    let!(:game) { create(:game) }
    let(:url) { "/admin/v1/games/#{game.id}" }

    it "removes game" do
      expect do
        delete url, headers: auth_header(user)
      end.to change(Game, :count).by(-1)
    end

    it "returns success status" do
      delete url, headers: auth_header(user)
      expect(response).to have_http_status(:no_content)
    end

    it "does not return body content" do
      delete url, headers: auth_header(user)
      expect(body_json).to_not be_present
    end
  end

end
