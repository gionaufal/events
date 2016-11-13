require 'rails_helper'

feature 'User uploads image to event' do
  scenario 'successfully' do
    visit new_event_path
    event = build(:event)

    fill_in 'Name', with: event.name
    fill_in 'Date', with: event.date
    fill_in 'Address', with: event.address
    attach_file('event_image', 'app/assets/images/woodstock.jpg')
    click_on 'Submit event'
    
    expect(page).to have_css("img[src*='woodstock.jpg']")
  end
end
