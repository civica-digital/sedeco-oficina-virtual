require 'rails_helper'

describe 'User can see tree zoning'  do
  scenario 'and he has zoning equipamiento', js: true do
    
    visit "/uso_de_suelo"
    page.driver.browser.manage.window.resize_to(1024, 768)

   # page.find("#menu-toggleint").click
    expect(page).to have_content "¿Cual es el uso de suelo del inmueble donde tienes o quieres poner tu establecimiento?"
    page.find("#image1-5").click

    expect(page).to have_content "Debido a los dato que recabamos hasta este punto, lo más conveniente para dar seguimiento a tu caso es hacer una cita."

  end

  scenario 'and he has home business with home <20', js: true do
    
    visit "/uso_de_suelo"
    page.driver.browser.manage.window.resize_to(1024, 768)

    #page.find("#menu-toggleint").click

    expect(page).to have_content "¿Cual es el uso de suelo del inmueble donde tienes o quieres poner tu establecimiento?"
    page.find("#image1-1").click

    expect(page).to have_content "¿El negocio está o desea abrirlo en su vivienda?"
    page.find("#image2-1").click

    expect(page).to have_content "¿Cuánto mide la vivienda donde está o se abrirá el negocio? (en m2)"
    fill_in 'date_3_1', :with => '100'
    find('#date_3_1').native.send_keys(:return)


    expect(page).to have_content "¿Cuánto mide o medirá el negocio? (en m2)"
    fill_in 'date_4_1', :with => '10'
    find('#date_4_1').native.send_keys(:return)

    expect(page).to have_content "¿En que delegación está ubicado o estará el inmueble?"
    page.find("#image8-2").click

    expect(page).to have_content "Gracias por sus respuestas de USO DE SUELO"

  end


  scenario 'and he has home business with home >20', js: true do
    
    visit "/uso_de_suelo"
    page.driver.browser.manage.window.resize_to(1024, 768)

    #page.find("#menu-toggleint").click

    expect(page).to have_content "¿Cual es el uso de suelo del inmueble donde tienes o quieres poner tu establecimiento?"
    page.find("#image1-1").click

    expect(page).to have_content "¿El negocio está o desea abrirlo en su vivienda?"
    page.find("#image2-1").click

    expect(page).to have_content "¿Cuánto mide la vivienda donde está o se abrirá el negocio? (en m2)"
    fill_in 'date_3_1', :with => '100'
    find('#date_3_1').native.send_keys(:return)


    expect(page).to have_content "¿Cuánto mide o medirá el negocio? (en m2)"
    fill_in 'date_4_1', :with => '30'
    find('#date_4_1').native.send_keys(:return)

    expect(page).to have_content "¿Cuentas con tu certificado de uso de suelo?"
    page.find("#image5-2").click


    expect(page).to have_content "¿En que delegación está ubicado o estará el inmueble?"
    page.find("#image8-2").click

    expect(page).to have_content "Por favor continua y al final se daran todos los trámites y pasos que tu negocio necesita."

  end


  scenario 'and he has NOT home business', js: true do
    
    visit "/uso_de_suelo"
    page.driver.browser.manage.window.resize_to(1024, 768)
    
    #page.find("#menu-toggleint").click

    expect(page).to have_content "¿Cual es el uso de suelo del inmueble donde tienes o quieres poner tu establecimiento?"
    page.find("#image1-1").click

    expect(page).to have_content "¿El negocio está o desea abrirlo en su vivienda?"
    page.find("#image2-2").click

    expect(page).to have_content "¿Cuánto mide o medirá el negocio? (en m2)"
    fill_in 'date_4_1', :with => '100'
    find('#date_4_1').native.send_keys(:return)

    expect(page).to have_content "¿Cuentas con tu certificado de uso de suelo?"
    page.find("#image5-2").click

    expect(page).to have_content "¿En que delegación está ubicado o estará el inmueble?"
    page.find("#image8-2").click

    expect(page).to have_content "Por favor continua y al final se daran todos los trámites y pasos que tu negocio necesita."

  end

end