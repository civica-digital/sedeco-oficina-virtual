require 'rails_helper'

describe 'User can see resources'  do
  scenario 'on learning center' do
    create_list(:resource, 2)
    resource = create :resource, name: "Primer recurso"
    other_resource = create :resource, name: "Otro"
    visit "/centro_de_aprendizaje"

    expect(page).to have_content resource.name
    expect(page).to have_content other_resource.name

    expect(resource_count).to eq 4
  end

  scenario 'on learning center' do
    resource = create :resource, name: "Primer recurso", category: "Impacto"
    other_resource = create :resource, name: "Otro", category: "Uso de Suelo"
    visit "/centro_de_aprendizaje"

    expect(page).to have_content resource.name
    expect(page).to have_content other_resource.name
    expect(resource_count).to eq 2

    click_link "Impacto"

    expect(page).to have_content resource.name
    expect(page).not_to have_content other_resource.name
    expect(resource_count).to eq 1

    click_link "Uso de Suelo"

    expect(page).not_to have_content resource.name
    expect(page).to have_content other_resource.name
    expect(resource_count).to eq 1
  end

  def resource_count
    all(".resource").size
  end

end
