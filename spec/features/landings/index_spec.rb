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

    it "happy path: when I put in email and password, I am taken to my dashboard page" do
      click_button "Log In"

      fill_in 'Email', with: 'user1@email.com'
      fill_in 'Password', with: 'password1'
      click_button "Log In"

      expect(current_path).to eq(user_path(@user.id))
    end

    it "sad path1: when I fail to put in correct password, I get an error message" do
      click_button "Log In"

      fill_in 'Email', with: 'user1@email.com'
      fill_in 'Password', with: 'passwor'
      click_button "Log In"

      expect(current_path).to eq('/login')
      expect(page).to have_content("You have entered incorrect information.")
    end

    it "sad path1: when I fail to put in correct password, I get an error message" do
      click_button "Log In"

      fill_in 'Email', with: 'user100@email.com'
      fill_in 'Password', with: 'password1'
      click_button "Log In"

      expect(current_path).to eq('/login')
      expect(page).to have_content("You have entered incorrect information.")
    end
  end
end

# As a registered user
# When I visit the landing page `/`
# And click on the link to go to my dashboard
# And fail to fill in my correct credentials
# I'm taken back to the Log In page
# And I can see a flash message telling me that I entered incorrect credentials.
