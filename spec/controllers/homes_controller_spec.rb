require 'rails_helper'

RSpec.describe HomesController, type: :controller do
     describe 'GET #index' do
     it 'returns http redirect' do
       get :index
       expect(response).to have_http_status(302)
     end
   end
 end
