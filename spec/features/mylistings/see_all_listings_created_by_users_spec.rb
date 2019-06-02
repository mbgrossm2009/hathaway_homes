require 'rails_helper'


feature "View index page to see all listings" do
  let(:user) {FactoryBot.create(:user)}
  let!(:mylisting) {FactoryBot.create(:mylisting)}
  let!(:mylisting2) {FactoryBot.create(:mylisting, town: "Boston")}

  scenario "View all listings" do
    sign_in user
    visit mylistings_path

    expect(page).to have_content(mylisting.town)
    expect(page).to have_content("Boston")
  end
end
