require 'rails_helper'

RSpec.describe HomesController, type: :controller do
     describe 'GET #index' do
     it 'returns http success' do
       get :index
       expect(response).to have_http_status(302)
     end
   end
 end

# RSpec.describe HomesController do
#   describe "GET home#index" do
#     render_views
#     it "fetch posts" do
#       @posts = Post.all
#       get :index, @posts
#       expect(response).to render_template("index")
#     end

#     it "renders the index template" do
#       get :index
#       expect(response).to render_template("index")
#     end
#   end
# end