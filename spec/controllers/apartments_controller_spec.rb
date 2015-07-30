require 'rails_helper'

RSpec.describe ApartmentsController, type: :controller do
  describe "GET index" do
    before(:each) do
      @apartment = FactoryGirl.create(:apartment)
    end

    it 'shows index view' do
      get :index
      expect(response).to be_success
    end

    it 'populates an array of apartments' do
      get :index
      assigns(:apartments).should eq([@apartment])
    end
  end
end
