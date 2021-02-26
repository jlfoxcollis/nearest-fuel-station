require 'rails_helper'

describe "user can visit the welcome page" do
  scenario "and see a dropdown menu" do
    visit '/'
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  scenario "select Turing From Dropdown" do
    visit '/'
    # find("#location").find(:option, "1331 17th St LL100, Denver, CO 80202").select_option
    # within "#location" do
    #   click_option "Turing"
    # end
    click_on "Find Nearest Station"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("Fuel Type")
    expect(page).to have_content("Access Times")


  end
end

