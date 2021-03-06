require 'rails_helper'

feature 'admin can view the users page' do
  let(:user) {FactoryBot.create(:user)}

  scenario ' admin views users page' do
    sign_in user
    user.update_attributes(admin: true)
    visit mylistings_path
    click_link "Admin Page"

    expect(page).to have_content("Admin Page")
  end
  #
  # scenario "non admin views admin page" do
  #   sign_in user
  #   user.update_attributes(admin: false)
  #   visit users_path
  #   click_link "Admin Page"
  #
  # end

end
