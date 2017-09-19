require 'rails_helper'


feature "View index page to see all phones" do
  let(:user) {FactoryGirl.create(:user)}
  let!(:listing) {FactoryGirl.create(:listing)}
  let!(:listing2) {FactoryGirl.create(:listing, town: "Boston")}

  scenario "View all phones" do
    sign_in user
    visit listings_path

    expect(page).to have_content(listing.town)
    expect(page).to have_content("Boston")
  end
end
