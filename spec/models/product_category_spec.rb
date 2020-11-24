require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  # subject { build(:product) }

  # it { is_expected.to validate_presence_of(:name)}
  # it { is_expected.to validate_uniqueness_of(:name).case_insensitive} #ver model

  # it { is_expected.to validate_presence_of(:description)}
  # it { is_expected.to validate_presence_of(:price)}
  # it { is_expected.to validate_numericality_of(:price).is_greater_than(0)}
  # it { is_expected.to validate_presence_of(:productable)}
  it { is_expected.to belong_to :product}
  it { is_expected.to belong_to :category}

  it_behaves_like "paginatable concern", :product_category
end
