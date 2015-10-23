require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  describe "GET #not_found" do
    it "returns http not_found code" do
      get :not_found
      expect(response).to have_http_status(:missing)
    end
  end

  describe "GET #server_error" do
    it "returns http server error" do
      get :server_error
      expect(response).to have_http_status(:error)
    end
  end

end
