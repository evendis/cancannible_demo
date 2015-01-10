require 'rails_helper'

describe PermissionsController do
  render_views

  describe "GET :index" do

    let(:user)             { FactoryGirl.create(:user) }
    let!(:permission)      {
      group = FactoryGirl.create(:group)
      group.can :author, Article # made up a random permission
      group.permissions.first
    }

    subject { get :index }


    context "when user is not authenticated" do
      it "should redirect with alert" do
        expect(subject).to be_redirect
        expect(flash.alert).to be_present
      end
    end


    context "when user is authenticated but has no special permissions" do

      before do
        sign_in user
      end

      it "should be allowed to see all permission anyway (for the purpose of this demo app)" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: permission.id)
      end

    end


  end

end
