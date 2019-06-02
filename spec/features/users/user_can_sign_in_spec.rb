require 'rails_helper'



feature "user can sign up when filling form out correctly" do

  scenario 'a user can sign up successfully' do
    visit mylistings_path
    click_link "Your Account"
    click_link "Sign Up"

    fill_in "First name", with: "Matt"
    fill_in "Last name", with: "Grossman"
    fill_in "Phone number", with: "508-614-0979"
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to_not have_content ("Name can't be blank")

  end

  scenario 'a user who does not give their name can not sign up' do
    visit mylistings_path
      click_link "Your Account"
    click_link "Sign Up"
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Phone number", with: "508-614-0979"
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("First name can't be blank ")
    expect(page).to have_content("Last name can't be blank ")

  end

  scenario 'A user who does not provide a phone number can not sign up' do
    visit mylistings_path
      click_link "Your Account"
    click_link "Sign Up"
    fill_in "First name", with: "Matt"
    fill_in "Last name", with: "Grossman"
    fill_in "Phone number", with: ""
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Phone number can't be blank")
  end

  scenario 'A user who does not provide an email can not sign up' do

    visit mylistings_path
      click_link "Your Account"
    click_link "Sign Up"
    fill_in "First name", with: "Matt"
    fill_in "Last name", with: "Grossman"
    fill_in "Phone number", with: "508-614-0979"
    fill_in "Email", with: ""
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")

  end

    scenario "A user can log out succesfully" do
    visit mylistings_path
      click_link "Your Account"
    click_link "Sign Up"
    fill_in "First name", with: "Matt"
    fill_in "Last name", with: "Grossman"
    fill_in "Phone number", with: "508-614-0979"
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    click_link("Sign Out")

    expect(page).to have_content("Sign Out")
  end
end
