require 'rails_helper'

describe 'User can see tree safety'  do

  scenario 'and he has aforo > 50', js: true do
    
    visit "/proteccion_civil_y_otros"
    page.driver.browser.manage.window.resize_to(1224, 768)

    #page.find("#menu-toggleint").click

    expect(page).to have_content "¿Cuál es tu aforo?"
    fill_in 'date_1_1', :with => '100'
    find('#date_1_1').native.send_keys(:return)

    expect(page).to have_content "¿Cuentas con el visto bueno de seguridad y operación?"
    page.find("#image4-2").click

    expect(page).to have_content "¿Tienes autorizado e implementado tu programa interno de protección civil?"
    page.find("#image6-2").click

    expect(page).to have_content "¿Sabes si requieres una Licencia Ambiental Única (LAUDF)?"
    page.find("#image7-2").click

    expect(page).to have_content "¿Sabes si requieres un aviso de funcionamiento sanitario?"
    page.find("#image9-2").click

    expect(page).to have_content "Terminamos."

  end

    scenario 'and he has aforo < 50', js: true do
    
    visit "/proteccion_civil_y_otros"
    page.driver.browser.manage.window.resize_to(1224, 768)
    
   # page.find("#menu-toggleint").click

    expect(page).to have_content "¿Cuál es tu aforo?"
    fill_in 'date_1_1', :with => '49'
    find('#date_1_1').native.send_keys(:return)

    expect(page).to have_content "¿Recogiste y entregaste el autodiagnóstico en materia de protección civil en tu delegación?"
    page.find("#image3-2").click

    expect(page).to have_content "¿Sabes si requieres una Licencia Ambiental Única (LAUDF)?"
    page.find("#image7-2").click

    expect(page).to have_content "¿Sabes si requieres un aviso de funcionamiento sanitario?"
    page.find("#image9-2").click

    expect(page).to have_content "Terminamos."

  end

end