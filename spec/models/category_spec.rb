require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of(:name) } #shoulda #ver model
  #it { expect(subject).to validate_presence_of(:name) } #rspec
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive} #ver model

  it { is_expected.to have_many(:product_categories).dependent(:destroy)}
  it { is_expected.to have_many(:products).through(:product_categories)}
end
