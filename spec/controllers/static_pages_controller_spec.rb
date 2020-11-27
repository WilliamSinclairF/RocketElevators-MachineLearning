require 'spec_helper'
require 'rails_helper'

describe StaticPagesController, type: :controller do
  describe '#residential' do
    it 'should render the residential page' do
      get :residential
      expect(response).to render_template('static_pages/residential')
    end
  end
  describe '#corporate' do
    it 'should render the corporate page' do
      get :corporate
      expect(response).to render_template('static_pages/corporate')
    end
  end
end
