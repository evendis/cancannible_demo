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


    context "when user has no permissions to see Customers" do

      before do
        sign_in user
      end

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
        expect(response.body).to have_selector('td.test_id', text: restricted_customer.id)
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

    context "when user has a customer relationship" do
      let(:my_customer)  { FactoryGirl.create(:customer) }
      let(:user)         { FactoryGirl.create(:user, customer: my_customer) }
      before do
        user.can :read, Customer
        sign_in user
      end

      it "they should only see their own Customer" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: my_customer.id)
        expect(response.body).to_not have_selector('td.test_id', text: customer.id)
        expect(response.body).to_not have_selector('td.test_id', text: restricted_customer.id)
      end

    end


    context "when user can read all Customers through a group permission" do
      let(:group)               { FactoryGirl.create(:group) }
      let(:user)                { FactoryGirl.create(:user, group: group) }

      before do
        group.can :read, Customer
        sign_in user
      end

      it "they should see all customers" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: customer.id)
        expect(response.body).to have_selector('td.test_id', text: restricted_customer.id)
      end

    end


    context "when user can read all Customers through a role permission" do
      let(:role)               { FactoryGirl.create(:role) }

      before do
        user.roles << role
        role.can :read, Customer
        sign_in user
      end

      it "they should see all customers" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: customer.id)
        expect(response.body).to have_selector('td.test_id', text: restricted_customer.id)
      end

    end


  end

end
