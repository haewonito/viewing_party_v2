require "rails_helper"

RSpec.describe "register page", type: :feature do
  it "happy path: as a visitor, when I fill out the form to register, I am taken to my dashboard page" do

      visit register_path

      expect(current_path).to eq(register_path)

      fill_in 'Name', with: 'User 1'
      fill_in 'Email', with: 'user1@email.com'
      fill_in "Password", with: "password1"
      fill_in "Password confirmation", with: "password1"

      click_button 'Create New User'

      user = User.last

      expect(current_path).to eq(user_path(user.id))
  end

  it "sad path: I get an error message if I fail to fill in my name" do

    visit register_path

    fill_in 'Email', with: 'user1@email.com'
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"

    click_button 'Create New User'

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Name can't be blank")
  end

  it "sad path: I get an error message if my email is not unique" do

    visit register_path

    fill_in 'Name', with: 'User 1'
    fill_in 'Email', with: 'user1@email.com'
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"

    click_button 'Create New User'
    click_link "Home"
    click_button "Create a New User"

    fill_in 'Name', with: 'User 2'
    fill_in 'Email', with: 'user1@email.com'
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"

    click_button 'Create New User'

    expect(page).to have_content("Email has already been taken")
  end

  it "sad path: I get an error message if my passwords don't match" do
    visit register_path

    fill_in 'Name', with: 'User 1'
    fill_in 'Email', with: 'user1@email.com'
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password2"

    click_button 'Create New User'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end


# As a visitor
# When I visit `/register`
# and I fail to fill in my name, unique email, OR matching passwords,
# I'm taken back to the `/register` page
# and a flash message pops up, telling me what went wrong
