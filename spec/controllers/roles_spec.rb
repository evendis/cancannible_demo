require 'rails_helper'

describe RolesController do
  render_views

  describe "GET :index" do

    let(:user)             { FactoryGirl.create(:user) }
    let!(:role)            { FactoryGirl.create(:role) }

    subject { get :index }


    context "when user is not authenticated" do
      it "should redirect with alert" do
        expect(subject).to be_redirect
        expect(flash.alert).to be_present
      end
    end


    context "when user is authenticated but no special permissions" do

      before do
        sign_in user
      end

      it "should be allowed to see all roles anyway (for the purpose of this demo app)" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: role.id)
      end

    end


  end

end
