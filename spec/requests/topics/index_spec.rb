require 'rails_helper'

describe 'GET /topics', type: :request do
  subject { get topics_path, as: :json }

  it 'returns success' do
    subject
    expect(response).to be_successful
  end

  context 'when the are no topics' do
    it 'returns an empty list' do
      subject
      expect(json[:topics].count).to eq 0
    end
  end

  context 'when there are 2 topics' do
    let!(:topic_list) { create_list(:topic, 2) }

    it 'returns a list with 2 topics' do
      subject
      expect(json[:topics].count).to eq 2
    end

    it 'returns the correct information' do
      subject
      expect(json[:topics]).to match_array(
        topic_list.map do |topic|
          {
            id: topic.id,
            name: topic.name
          }
        end
      )
    end
  end
end
