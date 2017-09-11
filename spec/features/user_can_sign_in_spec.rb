require 'rails_helper'
require 'pry'


feature "user can sign up giving when filling form out correctly" do

  scenario 'a user can sign up successfully' do
    visit listings_path
    click_link "Sign Up"
    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Grossman"
    fill_in "Phone Number", with: "508-614-0979"
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Logout")
    expect(page).to_not have_content ("Name can't be blank")

  end

  scenario 'a user who does not give their name can not sign up' do
    visit listings_path
    click_link "Sign Up"
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Phone Number", with: "508-614-0979"
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to_not have_content("logout")
    expect(page).to have_content("First Namecan't be blank")
    expect(page).to have_content("Last Namecan't be blank")

  end

  scenario 'A user who does not provide a phone number can not sign up' do
    visit listings_path
    click_link "Sign Up"
    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Grossman"
    fill_in "Phone Number", with: ""
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to_not have_content("logout")
    expect(page).to have_content("Phone Numbercan't be blank")
  end

  scenario 'A user who does not provide an email can not sign up' do

    visit listings_path
    click_link "Sign Up"
    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Grossman"
    fill_in "Phone Number", with: "508-614-0979"
    fill_in "Email", with: ""
    fill_in "user_password", with: "password"
    fill_in "password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to_not have_content("logout")
    expect(page).to have_content("Emailcan't be blank")

  end

    scenario "A user rcan log out succesfully" do
    visit listings_path
    click_link "Sign Up"
    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Grossman"
    fill_in "Phone Number", with: "508-614-0979"
    fill_in "Email", with: "grossmanmatt@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "password confirmation", with: "password"
    click_button "Sign up"

    click_link("Logout")

    expect(page).to_not have_content("Logout")
  end
end
