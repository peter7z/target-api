# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Topic do
  describe 'validations' do
    subject { build :topic }
    it { is_expected.to validate_presence_of(:name) }
  end
end
