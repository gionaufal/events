require 'rails_helper'

feature 'User creates events' do
  scenario 'successfully' do
    visit root_path

    click_on 'New event'
    fill_in 'Name', with: 'Woodstock'
    fill_in 'Address', with: 'Bethel, NY'
    fill_in 'Date', with: '16/08/1969'
    fill_in 'Tag', with: 'Festival'
    click_on 'Submit event'

    expect(page).to have_css('h2', text: 'Woodstock')
    expect(page).to have_content('Where: Bethel, NY')
    expect(page).to have_content(
                    "When: #{'16/08/1969'.to_date.strftime('%A, %d %b %Y')}" )
    expect(page).to have_content('Festival')
  end

  scenario 'and doesnt fill all fields' do
    visit root_path

    click_on 'New event'

    click_on 'Submit event'

    expect(page).to have_content('Error creating event')
  end
end
