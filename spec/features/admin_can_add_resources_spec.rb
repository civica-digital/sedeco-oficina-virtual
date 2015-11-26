require 'rails_helper'

describe 'Admin can add resources' do
  scenario 'from admin panel' do
    admin = create :admin
    login_as admin

    visit "/admins/recursos"

    click_link "Centro de aprendizaje"
    click_link "Agregar un recurso"

    fill_in "Nombre del Recurso", with: "Mi recurso"
    fill_in "Liga del recurso", with: "http://mirecurso.com"
    select "Impacto", from: "Tipo de recurso"
    click_button "Agregar recurso"

    expect(page).to have_content "El recurso se agregó exitosamente."
    expect(page).to have_content "Mi recurso"
    expect(page).to have_content "Impacto"
  end
end
