require 'rails_helper'

describe ArticlesController do
  render_views

  describe "GET :index" do

    let(:user)                { FactoryGirl.create(:user, group: users_group) }
    let(:users_group)         { nil }
    let(:group)               { FactoryGirl.create(:group) }

    let!(:article_for_all)    { FactoryGirl.create(:article) }
    let!(:article_for_group)  { FactoryGirl.create(:article, group: group) }

    subject { get :index }


    context "when user is not authenticated" do
      it "should redirect with alert" do
        expect(subject).to be_redirect
        expect(flash.alert).to be_present
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

    context "when user does not have a group" do

      context "and can read all Articles" do
        before do
          user.can :read, Article
          sign_in user
        end

        it "they should see articles that don't have a group" do
          expect(subject).to be_success
          expect(response.body).to have_selector('td.test_id', text: article_for_all.id)
          expect(response.body).to_not have_selector('td.test_id', text: article_for_group.id)
        end
      end

      context "and can read all Articles through a role permission" do
        let(:role)               { FactoryGirl.create(:role) }
        before do
          user.roles << role
          role.can :read, Article
          sign_in user
        end

        it "they should see articles that don't have a group" do
          expect(subject).to be_success
          expect(response.body).to have_selector('td.test_id', text: article_for_all.id)
          expect(response.body).to_not have_selector('td.test_id', text: article_for_group.id)
        end
      end

      context "and can only read specific Articles" do
        let!(:special_article)    { FactoryGirl.create(:article) }
        before do
          user.can :read, special_article
          sign_in user
        end

        it "they should only see those articles" do
          expect(subject).to be_success
          expect(response.body).to have_selector('td.test_id', text: special_article.id)
          expect(response.body).to_not have_selector('td.test_id', text: article_for_all.id)
          expect(response.body).to_not have_selector('td.test_id', text: article_for_group.id)
        end
      end

    end


    context "when user has a group" do
      let(:users_group)              { group }
      let(:other_group)              { FactoryGirl.create(:group) }
      let!(:article_for_other_group) { FactoryGirl.create(:article, group: other_group) }

      context "and can read all Articles" do
        before do
          user.can :read, Article
          sign_in user
        end

        it "they should see articles that don't have a group or are for their group" do
          expect(subject).to be_success
          expect(response.body).to have_selector('td.test_id', text: article_for_all.id)
          expect(response.body).to have_selector('td.test_id', text: article_for_group.id)
          expect(response.body).to_not have_selector('td.test_id', text: article_for_other_group.id)
        end
      end

      context "and can read all Articles thru group permission" do
        before do
          group.can :read, Article
          sign_in user
        end

        it "they should see articles that don't have a group or are for their group" do
          expect(subject).to be_success
          expect(response.body).to have_selector('td.test_id', text: article_for_all.id)
          expect(response.body).to have_selector('td.test_id', text: article_for_group.id)
          expect(response.body).to_not have_selector('td.test_id', text: article_for_other_group.id)
        end
      end

    end



  end

end
