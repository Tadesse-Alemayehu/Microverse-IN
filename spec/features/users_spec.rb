require 'rails_helper'

RSpec.describe "Users actions", type: :feature do
  describe "/users" do

  end

  describe "Find all the user information on a user (show) page" do
    before(:all) do
      @user=User.first
    end
    before(:each) do
      visit "/users/#{@user["id"]}"
    end

    it "finds user first name on the page" do
      expect(page).to have_content(@user["first_name"])
    end
    it "finds user last name on the page" do
      expect(page).to have_content(@user["last_name"])
    end
    it "finds user status on the page" do
      expect(page).to have_content(@user["status"])
    end
    it "finds user email on the page" do
      expect(page).to have_content(@user["email"])
    end
  end
end
