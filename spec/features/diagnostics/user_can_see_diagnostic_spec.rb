require 'rails_helper'

describe 'User can see tree impact'  do
  scenario 'and he has impacto zonal', js: true do
    
    visit "/impacto"
    page.driver.browser.manage.window.resize_to(1324, 768)
    
    expect(page).to have_content "¿Ya cuentas con un establecimiento mercantil?"
    page.find("#image1-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image2-6").click
    sleep 1
    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?",count: 2
    page.find("#image3-5").click
    
    expect(page).to have_content "¿Ya registraste tu negocio en el Sistema Electrónico de Avisos y Permisos de Establecimientos Mercantiles (SIAPEM)?"
    page.find("#image4-2").click
    sleep 1
    expect(page).to have_content "¿Cuentas con declaración de apertura anterior a Marzo 2011?"
    page.find("#image7-2").click
    
    sleep 2

    click_link('Siguiente paso "Uso de suelo"')


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

    sleep 1
    click_link('Siguiente paso "Protección civil"')


    expect(page).to have_content "¿Cuál es tu aforo?"
    fill_in 'date_1_1', :with => '49'
    find('#date_1_1').native.send_keys(:return)

    expect(page).to have_content "¿Recogiste y entregaste el autodiagnóstico en materia de protección civil en tu delegación?"
    page.find("#image3-2").click
    sleep 1

    expect(page).to have_content "¿Sabes si requieres una Licencia Ambiental Única (LAUDF)?"
    page.find("#image7-2").click

    expect(page).to have_content "¿Sabes si requieres un aviso de funcionamiento sanitario?"
    page.find("#image9-2").click

    sleep 1
    click_link('Siguiente paso "Ver diagnóstico"')



    expect(page).to have_content 'Resultado de "Impacto y estatus de registro"'
    expect(page).to have_content 'Resultado de "Uso de suelo"'
    expect(page).to have_content 'Resultado de "Protección civil y otras materias"'

  end
end