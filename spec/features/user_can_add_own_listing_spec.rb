require 'rails_helper'
require 'pry'

feature "An authorized user can add his or her own listing" do

  let(:user) {FactoryGirl.create(:user)}

  scenario "Can add own listing" do

    sign_in user
    visit new_listing_path
    fill_in "House Style", with: "Ranch"
    fill_in "Street Address", with: "8 Valley Brook Rd"
    fill_in "State", with: "MA"
    fill_in "Zipcode", with: "01581"
    fill_in "Number of Acres", with: 345
    fill_in 'Asking Price', with: "$120,000"
    click_button "Create"

    expect(page).to have_content("Ranch")


  end
end
