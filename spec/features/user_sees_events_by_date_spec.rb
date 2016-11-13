require 'rails_helper'

feature 'User sees events ordered by date' do
  scenario 'successfully' do
    event1 = create(:event, name: 'Crazy event', date: '10/10/2016')
    event2 = create(:event, name: 'First event', date: '05/05/2016')

    visit root_path
    within('article:first-child') do
      expect(page).to have_content(event2.name)
      expect(page).to have_content(event2.friendly_date)
      expect(page).not_to have_content(event1.name)
      expect(page).not_to have_content(event1.friendly_date)
    end
    within('article:nth-child(2)') do
      expect(page).to have_content(event1.name)
      expect(page).to have_content(event1.friendly_date)
      expect(page).not_to have_content(event2.name)
      expect(page).not_to have_content(event2.friendly_date)
    end
  end
end
