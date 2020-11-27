require 'spec_helper'
require 'rails_helper'

describe LeadsController, type: :controller do
  describe '#create' do
    it 'creates a new lead and redirects to the root page if user is not signed in' do
      post :create,
           params: {
             lead: {
               full_name: 'bob',
               email: 'bob@bob.com',
               phone: '123-123-1234',
               business_name: 'great stuff',
               project_name: 'great stuff',
               department: 'great stuff',
               project_description: 'great stuff',
               message: 'great stuff'
             }
           }
      expect(response).to redirect_to('/')
    end
  end
end
