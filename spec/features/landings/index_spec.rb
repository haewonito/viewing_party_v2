require "rails_helper"

RSpec.describe "landing page", type: :feature do
  describe "as a registered user" do
    before(:each) do
      visit register_path

      expect(current_path).to eq(register_path)

      fill_in 'Name', with: 'User 1'
      fill_in 'Email', with: 'user1@email.com'
      fill_in "Password", with: "password1"
      fill_in "Password confirmation", with: "password1"

      click_button 'Create New User'

      @user = User.last
      visit root_path
    end

    it "when I click on login button, I am taken to a Log In page" do
      click_button "Log In"
      expect(current_path).to eq('/login')
    end

    it "when I put in email and password, I am taken to my dashboard page" do
      click_button "Log In"

      fill_in 'Email', with: 'user1@email.com'
      fill_in 'Password', with: 'password1'
      click_button "Log In"
      
      expect(current_path).to eq(user_path(@user.id))
    end
  end
end
