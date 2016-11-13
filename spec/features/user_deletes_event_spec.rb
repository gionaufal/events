require 'rails_helper'

feature 'User deletes event' do
  scenario 'successfully' do
    event = create(:event)
    
    visit event_path(event)

    click_on 'Delete'

    visit root_path

    expect(page).not_to have_content(event.name)
  end
end
