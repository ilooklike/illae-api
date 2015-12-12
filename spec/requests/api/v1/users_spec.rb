require "rails_helper"

RSpec.describe "UsersController" do
  it 'returns a list of all users' do
    3.times { create(:user) }

    get '/api/v1/users'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(3)
  end

  it 'returns a list of all users' do
    user = create(:user)

    get "/api/v1/users/#{user.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['first_name']).to eq('Ada')
    expect(json['last_name']).to eq('Lovelace')
  end
end
