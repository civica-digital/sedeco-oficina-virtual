require 'rails_helper'

describe 'User can see tree impact'  do
  scenario 'and he has impacto vecinal', js: true do
    
    visit "/impacto"
    expect(page).to have_content "¿Ya cuentas con un establecimiento mercantil?"
    page.find("#image1-1").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image2-6").click

    expect(page).to have_content "¿Deseas abrir o tienes un negocio con alguno de estos giros?"
    page.find("#image3-1").click

    expect(page).to have_content "Impacto Zonal"

  end
end
