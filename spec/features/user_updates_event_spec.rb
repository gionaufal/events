require 'rails_helper'

feature 'User updates events' do
  scenario 'successfully' do
    event = create(:event)

    visit event_path(event)

    click_on 'Edit event'

    fill_in 'Name', with: 'Woodstock'
    fill_in 'Address', with: 'Bethel, NY'
    fill_in 'Date', with: '08/16/1969'
    click_on 'Update event'

    expect(page).to have_css('h1', text: 'Woodstock')
    expect(page).to have_content('Where: Bethel, NY')
    expect(page).to have_content('When: 08/16/1969')
  end
end
