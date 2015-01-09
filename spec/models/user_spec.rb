require 'rails_helper'

describe User do

  let(:user)     { FactoryGirl.create(:user) }
  let(:article)  { FactoryGirl.create(:article) }
  let(:customer) { FactoryGirl.create(:customer) }

  context "with no special permissions" do

    it "should not be able to read Articles" do
      expect(user.can? :read, Article).to eql false
      expect(user.can? :read, article).to eql false
    end

    it "should not be able to read Customer" do
      expect(user.can? :read, Customer).to eql false
      expect(user.can? :read, customer).to eql false
    end

  end

  context "when directly assigned a permission" do
    context "to read Articles" do
      before do
        user.can :read, Article
      end
      it "should be able to read them" do
        expect(user.can? :read, Article).to eql true
        expect(user.can? :read, article).to eql true
      end
    end
  end

end
