require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name)}

  it { is_expected.to validate_presence_of(:profile)}
  it { is_expected.to define_enum_for(:profile).with_values({admin: 0, client: 1})}



  # it { is_expected.to validate_presence_of(:storage)}
  # it { is_expected.to validate_presence_of(:processor)}
  # it { is_expected.to validate_presence_of(:memory)}
  # it { is_expected.to validate_presence_of(:video_board)}
  # it { is_expected.to have_many(:games).dependent(:restrict_with_error)}
end
