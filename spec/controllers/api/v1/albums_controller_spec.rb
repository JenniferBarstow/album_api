require "rails_helper"
require "spec_helper"

RSpec.describe Api::V1::AlbumsController do
  describe 'with existing albums' do
      let!(:album1) { FactoryGirl.create(:album, name: "Year of Hibernation",
                              artist_id: 1,
                              genre: "rock",
                              year: 2014) }

    describe 'get index' do
      it 'returns a list of all albums' do

        get :index

        albums = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(albums.first["name"]).to eq("Year of Hibernation")
      end
    end

    describe 'get show' do
      it 'returns an album' do
        get :show, id: album1.id

        album = JSON.parse(response.body)
    
        expect(response.status).to eq(200)
        expect(album["name"]).to eq("Year of Hibernation")
      end
    end

    describe 'put update' do
      it 'updates an album' do

        put :update, id: album1.id, album: {name: "No love"}
        get :show, id: album1.id

        album = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(album["name"]).to eq("No love")
      end
    end

    describe 'delete destroy' do
      it 'deletes an item' do

        delete :destroy, id: album1.id 

        expect(response.status).to eq(200)
        expect(Album.count).to eq(0)
      end
    end
  end

  describe 'without existing albums' do
    describe 'post create' do
      it 'creates an album' do

        expect(Album.count).to eq(0)

        post :create, album: { name: "Our Love",
                               artist_id: 303,
                               genre: "electronic",
                               year: 2014
                              }

        expect(response.status).to eq(200)
        expect(Album.count).to eq(1)
      end
    end
  end

  

end