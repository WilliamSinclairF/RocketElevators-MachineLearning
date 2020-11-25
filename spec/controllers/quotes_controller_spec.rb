require 'spec_helper'
require 'rails_helper'

describe QuotesController, type: :controller do
  describe '#create' do
    it 'creates a new quote and redirects to the root page if user is not signed in' do
      get :new
      expect(response).to render_template('quotes/new')
      post :create,
           params: {
             quote: {
               apartments: 1,
               floors: 1,
               basements: 1,
               product_line: 'Standard',
               install_fee: 11,
               total_price: 22,
               unit_price: 33,
               elevator_number: 5,
               building_type: 'Foo',
               full_name: 'bob',
               phone: '123-123-1234',
               email: 'bob@bob.com'
             }
           }

      expect(response).to redirect_to('/')
    end
  end
end
