require 'rails_helper'

describe 'GET /targets', type: :request do
  let!(:user)  { create(:user) }
  let!(:user_targets) { create_list(:target, 3, user: user) }

  before { get targets_path, headers: auth_user_headers, as: :json }

  context 'when the user is authenticated and has targets' do
    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a list with 3 targets' do
      expect(json[:targets].count).to eq 3
    end

    it 'returns the correct information' do
      expect(json[:targets]).to match_array(
        user_targets.map do |target|
          {
            id: target.id,
            topic: {
              id: target.topic.id,
              name: target.topic.name
            },
            title: target.title,
            radius: target.radius,
            latitude: target.latitude.round(10),
            longitude: target.longitude.round(10)
          }
        end
      )
    end
  end
end
