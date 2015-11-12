require 'rails_helper'

describe 'User can set an appointment', js: true do
  scenario 'selecting a day from calendar' do
    current_month = I18n.l(Time.now, format: "%B")
    visit "/citas"

    expect(calendar_input).to be_present
    expect(page).to have_content current_month.upcase

    select_date Date.tomorrow
    expect(selected_date_cell).to be_present
  end

  def calendar_input
    all("#calendar").first
  end

  def select_date(date)
    click_link date.day
  end

  def selected_date_cell
    all("td.ui-datepicker-current-day").first
  end
end
