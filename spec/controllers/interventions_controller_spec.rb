require 'spec_helper'
require 'rails_helper'

describe InterventionsController do
  describe 'GET index' do
    it 'shows all interventions' do
      get :index
      expect(response).to have_http_status(:found)
    end
  end
  describe 'GET buildings' do
    it 'gets buildings based on the ID provided in params' do
      get :buildings, params: { 'id' => '1' }
      expect(response.media_type).to eq 'text/html'
      expect(response).to have_http_status(:found)
    end
  end
  describe 'GET batteries' do
    it 'gets batteries based on the ID provided in params' do
      get :batteries, params: { 'id' => '1' }
      expect(response.media_type).to eq 'text/html'
      expect(response).to have_http_status(:found)
    end
  end
  describe 'GET columns' do
    it 'gets columns based on the ID provided in params' do
      get :columns, params: { 'id' => '1' }
      expect(response.media_type).to eq 'text/html'
      expect(response).to have_http_status(:found)
    end
  end
  describe 'GET elevators' do
    it 'gets elevators based on the ID provided in params' do
      get :elevators, params: { 'id' => '1' }
      expect(response.media_type).to eq 'text/html'
      expect(response).to have_http_status(:found)
    end
  end
end
