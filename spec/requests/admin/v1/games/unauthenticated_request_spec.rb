require 'rails_helper'

RSpec.describe "User::V1::Games as without authentication", type: :request do
  context "GET /games" do
    let(:url) { "/admin/v1/games"}
    let!(:games) { create_list(:game, 5) }
    before(:each) {get url}
    include_examples "unauthenticated_access"
  end

  context "POST /games" do
    let(:url) { "/admin/v1/games" }
    before(:each) {post url}
    include_examples "unauthenticated_access"
  end

  context "PATCH /games" do
    let!(:game) { create(:game) }
    let(:url) { "/admin/v1/games/#{game.id}"}
    before(:each) {patch url}
    include_examples "unauthenticated_access"
  end

  context "DELETE /games" do
    let!(:game) { create(:game) }
    let(:url) { "/admin/v1/games/#{game.id}" }
    before(:each) {delete url}
    include_examples "unauthenticated_access"
  end
end
