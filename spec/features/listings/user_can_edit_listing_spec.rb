require 'rails_helper'




feature "An authorized user can edit his or her own listing" do

  let(:user) {FactoryGirl.create(:user)}
  let(:listing) {FactoryGirl.create(:listing, user: user)}

  scenario "Can edit own listing" do
    sign_in user
    visit listings_path(listing)
    click_link "More Information"
    click_link "Edit Listing info here"
    fill_in "Town", with: "Boston"
    click_button "Save Changes"

    expect(page).to have_content("Boston")
    expect(page).to have_content("Listing Successfully Updated")
    expect(page).to_not have_content("Westborough")
  end
end
