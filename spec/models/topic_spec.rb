require 'rails_helper'

describe Topic do
  describe 'validations' do
    subject { build :topic }
    it { is_expected.to validate_presence_of(:name) }
  end
end
