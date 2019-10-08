require 'rails_helper'

describe 'POST /targets', type: :request do
  let!(:user)  { create(:user) }
  let!(:topic) { create(:topic) }

  let(:params) do
    {
      title: Faker::Cannabis.buzzword,
      topic_id: topic.id,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      radius: Faker::Number.between(from: 1, to: 5000)
    }
  end

  subject { post targets_path, params: params, headers: auth_user_headers, as: :json }

  it 'returns a successful response' do
    subject
    expect(response).to be_successful
  end

  it 'creates the target' do
    expect { subject }.to change(Target, :count).by(1)
  end

  it 'creates tthe target with the correct information' do
    subject
    target = Target.last
    expect(target.title).to eq(params[:title])
  end

  context 'when the user is not authenticated' do
    subject { post targets_path, params: params, as: :json }

    it 'does not create a target' do
      expect {
        subject
      }.not_to change { Target.count }
    end

    it 'does not return a successful response' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'when the user has 10 targets already' do
    let!(:targets) { create_list(:target, 10, user: user) }

    it 'returns a bad request response' do
      subject
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns the corresponding error' do
      subject
      expect(json['errors']['limit'][0]).to eq(I18n.t('max_targets'))
    end
  end
end
