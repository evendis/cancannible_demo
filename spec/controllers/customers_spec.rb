require 'rails_helper'

describe CustomersController do
  render_views

  describe "GET :index" do

    let(:user)                   { FactoryGirl.create(:user) }
    let!(:customer)              { FactoryGirl.create(:customer) }
    let!(:restricted_customer)   { FactoryGirl.create(:customer) }

    subject { get :index }


    context "when user is not authenticated" do
      it "should redirect with alert" do
        expect(subject).to be_redirect
        expect(flash.alert).to be_present
      end
    end


    context "when user read all Customers" do

      before do
        user.can :read, Customer
        sign_in user
      end

      it "they should see all customers" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: customer.id)
      end

    end


    context "when user can only read some Customers" do

      before do
        user.can :read, customer
        sign_in user
      end

      it "they should only see accessible Customers" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: customer.id)
        expect(response.body).to_not have_selector('td.test_id', text: restricted_customer.id)
      end

    end


    context "when user has no permissions to see Customers" do

      before do
        sign_in user
      end

      it "should redirect with alert" do
        expect(subject).to be_redirect
        expect(flash.alert).to be_present
      end

    end

  end

end
