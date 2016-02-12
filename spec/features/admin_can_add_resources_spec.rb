require 'rails_helper'

describe 'Admin can add resources' do
  scenario 'from admin panel' do
    admin = create :admin
    login_as admin

    visit "/admins/panel"

    click_link "Ingresar"
    click_link "Agregar un recurso"

    fill_in "Nombre del Recurso", with: "Mi recurso"
    fill_in "Liga", with: "http://mirecurso.com"
    fill_in "Descripción", with: "describe prueba"
    select "Impacto", from: "Categoría"
    click_button "Guardar"

    expect(page).to have_content "El recurso se agregó exitosamente."
    expect(page).to have_content "Mi recurso"
    expect(page).to have_content "Impacto"
  end

  scenario 'unless data is invalid' do
    admin = create :admin
    login_as admin

    visit "/admins/panel"

    click_link "Ingresar"
    click_link "Agregar un recurso"

    fill_in "Liga", with: "fakeurl"
    fill_in "Descripción", with: "describe prueba"
    select "Impacto", from: "Categoría"
    click_button "Guardar"

    expect(page).not_to have_content "El recurso se agregó exitosamente."
    expect(page).to have_content "No puede estar en blanco"
    expect(page).to have_content "No es una URL válida"
  end
end
