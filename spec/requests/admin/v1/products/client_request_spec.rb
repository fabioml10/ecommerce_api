require 'rails_helper'

RSpec.describe "Client::V1::Products as :client", type: :request do
  let(:user) { create(:user, profile: :client) }

  context "GET /products" do
    let(:url) { "/admin/v1/products"}
    let!(:products) { create_list(:product, 5) }
    before(:each) {get url, headers: auth_header(user)}
    include_examples "forbidden_access"
  end

  context "POST /products" do
    let(:url) { "/admin/v1/products" }
    before(:each) {post url, headers: auth_header(user)}
    include_examples "forbidden_access"
  end

  context "PATCH /products" do
    let!(:product) { create(:product) }
    let(:url) { "/admin/v1/products/#{product.id}"}
    before(:each) {patch url, headers: auth_header(user)}
    include_examples "forbidden_access"
  end

  context "DELETE /products" do
    let!(:product) { create(:product) }
    let(:url) { "/admin/v1/products/#{product.id}" }
    before(:each) {delete url, headers: auth_header(user)}
    include_examples "forbidden_access"
  end
end
