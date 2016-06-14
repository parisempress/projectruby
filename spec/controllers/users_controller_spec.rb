require 'rails_helper'

describe UsersController, :type => :controller do
  context "GET #show" do

    before do
      # @user = User.create!(first_name: "Sample", last_name: "User", email: "example@example.com", password: "Password1", password_confirmation: "Password1")
      # @second_user = User.create!(first_name: "Second", last_name: "User", email: "secondexample@example.com", password: "Password1", password_confirmation: "Password1")
      @user = FactoryGirl.create(:user)
      @second_user = FactoryGirl.create(:user)
      @admin = FactoryGirl.create(:admin)
    end

    describe "GET #show" do

      context "User is logged in" do

        before do
          @user.confirm
          sign_in @user
        end

        it "loads correct user details" do
          get :show, id: @user.id
          expect(assigns(:user)).to eq @user
        end

        it "responds with HTTP 302 Found status code and redirects to root path" do
          get :show, id: @second_user.id
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(root_path)
        end
      end

      context "No User is logged in" do

        it "redirects to login" do
          get :show, id: @user.id
          expect(response).to redirect_to(root_path)
        end

      end

    end

  end
end