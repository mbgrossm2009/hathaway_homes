require 'rails_helper'



feature "admin can create from api" do
  let(:user) {FactoryBot.create(:user, admin: true)}
  listing1  = FactoryBot.create(:zpid)


  scenario 'admin pulls listing from zillow' do
    sign_in user
    visit mylistings_path
    click_link "Admin"
    click_link "Admin Page"

    fill_in "Enter Zpid", with: listing1.zpid

    click_button "Create"

    expect(page).to have_content("Roxbury")
    expect(page).to have_content("MA")




  end
end
