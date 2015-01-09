require 'rails_helper'

describe ArticlesController do
  render_views

  describe "GET :index" do

    let(:user)                { FactoryGirl.create(:user) }
    let!(:article_for_all)    { FactoryGirl.create(:article) }
    let!(:restricted_article) { FactoryGirl.create(:article) }

    subject { get :index }


    context "when user is not authenticated" do
      it "should redirect with alert" do
        expect(subject).to be_redirect
        expect(flash.alert).to be_present
      end
    end


    context "when user can read all Articles" do

      before do
        user.can :read, Article
        sign_in user
      end

      it "they should see all articles" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: article_for_all.id)
        expect(response.body).to have_selector('td.test_id', text: restricted_article.id)
      end

    end


    context "when user can only read some Articles" do

      before do
        user.can :read, article_for_all
        sign_in user
      end

      it "they should only see accessible articles" do
        expect(subject).to be_success
        expect(response.body).to have_selector('td.test_id', text: article_for_all.id)
        expect(response.body).to_not have_selector('td.test_id', text: restricted_article.id)
      end

    end


    context "when user has no permissions to see Articles" do

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
