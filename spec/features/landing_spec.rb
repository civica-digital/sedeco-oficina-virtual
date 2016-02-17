require 'rails_helper'

describe 'the user can enter the website'  do
  scenario 'and he can see all access', js: true do
    
    page.driver.browser.manage.window.resize_to(1024, 768)

    visit(root_path)

    expect(page).to have_content I18n.t('landing.index.textmain')

    expect(page).to have_content I18n.t('landing.index.textmain_clic')

    expect(page).to have_content I18n.t('landing.index.menu.centro_titulo')

    expect(page).to have_content I18n.t('landing.index.menu.agenda_titulo')

    expect(page).to have_content I18n.t('landing.index.menu.ayuda_titulo')

  end

  scenario "see the diagnostic" , js: true do
    visit(root_path)
    page.find("#diagnostic_modal").click
    page.find("#diagnostic").click
    sleep 1
    expect(page.current_path).to eq impact_index_es_path
  end

  scenario "see the appointments" , js: true do
    visit(root_path)
    page.find("#cita").click
    sleep 1
    expect(page.current_path).to eq appointments_es_path
  end

  scenario "see the learning center" , js: true do
    visit(root_path)
    page.find("#learning").click
    sleep 1
    expect(page.current_path).to eq learning_center_index_es_path
  end

  scenario "see the help" , js: true do
    visit(root_path)
    page.find("#help").click
    sleep 1
    expect(page).to have_content I18n.t('landing.index.close')
  end
end