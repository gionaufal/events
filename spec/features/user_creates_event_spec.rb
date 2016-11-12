require 'rails_helper'

feature 'User creates events' do
  scenario 'successfully' do
    visit root_path

    click_on 'New event'

    fill_in 'Name', with: 'Woodstock'
    fill_in 'Address', with: 'Bethel, NY'
    fill_in 'Date', with: '08/16/1969'
    click_on 'Submit event'

    expect(page).to have_css('h1', text: 'Woodstock')
    expect(page).to have_content('Where: Bethel, NY')
    expect(page).to have_content('When: 08/16/1969')
  end

  scenario 'and doesnt fill all fields' do
    visit root_path

    click_on 'New event'

    click_on 'Submit event'

    expect(page).to have_content('Error creating event')
  end
end
