require 'rails_helper'

feature 'User sees events in home' do
  scenario 'successfully' do
    event = create(:event)
    event2 = create(:event, name: 'Event 2')

    visit root_path
    expect(page).to have_content event.name
    expect(page).to have_content event2.name
  end
end
