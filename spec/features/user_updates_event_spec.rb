require 'rails_helper'

feature 'User updates events' do
  scenario 'successfully' do
    event = create(:event)

    visit event_path(event)

    click_on 'Edit event'

    fill_in 'Name', with: 'Woodstock'
    fill_in 'Address', with: 'Bethel, NY'
    fill_in 'Date', with: '16/08/1969'
    click_on 'Update event'

    expect(page).to have_css('h2', text: 'Woodstock')
    expect(page).to have_content('Where: Bethel, NY')
    expect(page).to have_content(
                    "When: #{'16/08/1969'.to_date.strftime('%A, %d %b %Y')}" )
  end

  scenario 'and doesnt fill all fields' do
    event = create(:event)

    visit event_path(event)

    click_on 'Edit event'

    fill_in 'Name', with: ''
    click_on 'Update event'

    expect(page).to have_content('Error updating event')
  end
end
