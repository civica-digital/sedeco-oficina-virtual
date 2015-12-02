require 'rails_helper'

describe 'Admin can add resources' do
  scenario 'from admin panel' do
    admin = create :admin
    login_as admin

    visit "/admins/panel"

    click_link "Centro de aprendizaje"
    click_link "Agregar un recurso"

    fill_in "Nombre del Recurso", with: "Mi recurso"
    fill_in "Liga", with: "http://mirecurso.com"
    select "Impacto", from: "Categoría"
    click_button "Agregar"

    expect(page).to have_content "El recurso se agregó exitosamente."
    expect(page).to have_content "Mi recurso"
    expect(page).to have_content "Impacto"
  end

  scenario 'unless data is invalid' do
    admin = create :admin
    login_as admin

    visit "/admins/panel"

    click_link "Centro de aprendizaje"
    click_link "Agregar un recurso"

    fill_in "Liga", with: "fakeurl"
    select "Impacto", from: "Categoría"
    click_button "Agregar"

    expect(page).not_to have_content "El recurso se agregó exitosamente."
    expect(page).to have_content "no puede estar en blanco"
    expect(page).to have_content "No es una URL válida"
  end
end
