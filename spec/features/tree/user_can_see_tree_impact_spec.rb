require 'rails_helper'

describe 'User can see tree impact'  do
  scenario 'and he has impacto zonal', js: true do
    
    visit "/impacto"
    page.driver.browser.manage.window.resize_to(1024, 768)
    
    expect(page).to have_content "¿Ya cuentas con un establecimiento mercantil?"
    page.find("#image1-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image2-6").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?",count: 2
    page.find("#image3-1").click

    expect(page).to have_content "El impacto del negocio es Zonal"

  end

  scenario 'and he has impacto vecinal', js: true do
    
    visit "/impacto"
    page.driver.browser.manage.window.resize_to(1024, 768)

    expect(page).to have_content "¿Ya cuentas con un establecimiento mercantil?"
    page.find("#image1-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image2-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?",count: 1

    expect(page).to have_content "¿Ya registraste tu negocio en el Sistema Electrónico de Avisos y Permisos de Establecimientos Mercantiles (SIAPEM)?"
    page.find("#image4-2").click

    expect(page).to have_content "¿Cuentas con algún tipo de permiso o licencia de funcionamiento tipo A u ordinaria?"
    page.find("#image6-2").click
    
    expect(page).to have_content "Gracias por sus respuestas de IMPACTO y ESTATUS DE REGISTRO Por favor continua y al final se daran todos los trámites y pasos que tu negocio necesita"

  end


  scenario 'and he has impacto bajo, NO SIAPEM ', js: true do
    
    visit "/impacto"
    page.driver.browser.manage.window.resize_to(1024, 768)

    expect(page).to have_content "¿Ya cuentas con un establecimiento mercantil?"
    page.find("#image1-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image2-6").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?",count: 2
    page.find("#image3-5").click
    
    expect(page).to have_content "¿Ya registraste tu negocio en el Sistema Electrónico de Avisos y Permisos de Establecimientos Mercantiles (SIAPEM)?"
    page.find("#image4-2").click

    expect(page).to have_content "¿Cuentas con declaración de apertura anterior a Marzo 2011?"
    page.find("#image7-3").click
    
    expect(page).to have_content "Gracias por sus respuestas de IMPACTO y ESTATUS DE REGISTRO Por favor continua y al final se daran todos los trámites y pasos que tu negocio necesita"

  end

  scenario 'and he has impacto bajo, SI SIAPEM ', js: true do
    
    visit "/impacto"
    page.driver.browser.manage.window.resize_to(1024, 768)
    
    expect(page).to have_content "¿Ya cuentas con un establecimiento mercantil?"
    page.find("#image1-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image2-6").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?",count: 2
    page.find("#image3-5").click

    expect(page).to have_content "¿Ya registraste tu negocio en el Sistema Electrónico de Avisos y Permisos de Establecimientos Mercantiles (SIAPEM)?"
    page.find("#image4-1").click

    expect(page).to have_content "¿Cuándo te registraste en el SIAPEM?"

  end

end
