require 'rails_helper'

describe 'User can set an appointment'  do
  scenario 'selecting a day from calendar', js: true do
    current_month = I18n.l(Time.now, format: "%B")
    visit "/citas"

    expect(calendar_input).to be_present
    expect(page).to have_content current_month.upcase

    select_date Date.tomorrow
    expect(selected_date_cell).to be_present
  end

  scenario 'selecting a day from calendar and filling the form', js: true do
    current_month = I18n.l(Time.now, format: "%B")
    visit "/citas"

    expect(calendar_input).to be_present
    expect(page).to have_content current_month.upcase

    select_date Date.tomorrow
    fill_in "Nombre", with: "Maria x"
    fill_in "Correo electrónico", with: "maria@mail.com"
    fill_in "Teléfono", with: "1112223334"
    click_button "Agendar"

    expect(page).to have_content "La cita se ha agendado exitosamente."
  end

  scenario 'unless enters invalid data', js: true do
    current_month = I18n.l(Time.now, format: "%B")
    visit "/citas"

    expect(page).to have_content current_month.upcase

    select_date Date.tomorrow
    fill_in "Nombre", with: "Maria x"
    fill_in "Teléfono", with: "1112223334"
    click_button "Agendar"

    expect(page).to have_content "no puede estar en blanco"
  end

  scenario 'and an email with the appointment data is sent', js: true do
    current_month = I18n.l(Time.now, format: "%B")
    visit "/citas"

    expect(calendar_input).to be_present
    expect(page).to have_content current_month.upcase

    select_date Date.tomorrow
    fill_in "Nombre", with: "Maria x"
    fill_in "Correo electrónico", with: "maria@mail.com"
    fill_in "Teléfono", with: "1112223334"
    click_button "Agendar"

    expect(sent_email_subject).to eq "Nueva cita reservada en Oficina Virtual"
    expect(sent_email_content).to include "Maria x"
    expect(sent_email_content).to include "maria@mail.com"
    expect(sent_email_content).to include I18n.l(Date.tomorrow)
    expect(sent_email_content).to include "1112223334"
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

  def sent_email_subject
    sent_email.subject
  end

  def sent_email_content
    sent_email.body
  end

  def sent_email
    ActionMailer::Base.deliveries.last
  end
end
