require 'rails_helper'

feature 'User only sees events that have not happened yet' do
  scenario 'successfully' do
    event = create(:event, date: '01/01/2017')

    travel_to Time.new(2017, 01, 01, 00, 01, 00) do
      visit root_path

      expect(page).to have_content event.name
    end
  end
  scenario 'and does not see if the event has already passed' do
    event = create(:event, date: '01/01/2017')

    travel_to Time.new(2017, 01, 03, 00, 01, 00) do
      visit root_path

      expect(page).not_to have_content event.name
    end
  end
end
