require 'rails_helper'

feature 'User searches events by tag' do
  scenario 'successfully' do
    event = create(:event)
    visit root_path
    click_on event.tag

    expect(page).to have_content "Events tagged with #{event.tag}"
    expect(current_path).not_to be root_path
  end
end
