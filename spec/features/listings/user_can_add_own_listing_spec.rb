require 'rails_helper'
 

feature "An authorized user can add his or her own listing" do

  let(:user) {FactoryGirl.create(:user)}

  scenario "Can add own listing" do

    sign_in user
    visit new_listing_path
    select("Ranch", from: "House Style").select_option
    fill_in "Street Address", with: "8 Valley Brook Rd"
    fill_in "State", with: "MA"
    fill_in "Town", with: "Westborough"
    fill_in "Zipcode", with: "01581"
    fill_in "Number of Acres", with: "345"
    fill_in "Number of Bathrooms", with: 2
    fill_in "Number of Bedrooms", with: 5
    fill_in 'Asking Price', with: 120000
    attach_file "Listing Photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button "Create"

      expect(page).to have_content("Ranch")
      expect(page).to have_content("8 Valley Brook Rd")
      expect(page).to have_content("MA")
      expect(page).to have_content("01581")
      expect(page).to have_content("Westborough")
  end
  
  scenario "view items in show page" do
    sign_in user
    visit new_listing_path
    select("Ranch", from: "House Style").select_option
    fill_in "Street Address", with: "8 Valley Brook Rd"
    fill_in "State", with: "MA"
    fill_in "Town", with: "Westborough"
    fill_in "Zipcode", with: "01581"
    fill_in "Number of Acres", with: "345"
    fill_in "Number of Bathrooms", with: 2
    fill_in "Number of Bedrooms", with: 5
    fill_in 'Asking Price', with: 120000
    attach_file "Listing Photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button "Create"
    click_link "More Information"

      expect(page).to have_content("345")
      expect(page).to have_content("2")
      expect(page).to have_content("5")
      expect(page).to have_content("120000")
    end
end
