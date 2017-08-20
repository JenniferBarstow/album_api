require "rails_helper"
require "spec_helper"

RSpec.describe Api::V1::ArtistsController do

  let! :artist do
   FactoryGirl.create(:artist, name: "Youth Lagoon")
  end

  let! :album do
    FactoryGirl.create(:album, artist: artist, name: "Year of Hibernation")
  end

  describe 'get index' do
    it 'returns a list of all artists' do
      get :index

      artists = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(artists.first["name"]).to eq("Youth Lagoon")
    end
  end

  describe 'get show' do
    it 'returns all albums for given artist' do
      get :show, id: artist.id

      artist = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(artist["name"]).to eq("Youth Lagoon")
      expect(artist["albums"].first["name"]).to eq("Year of Hibernation")
    end
  end

end