require 'rails_helper'

RSpec.describe 'As a visitor to project show page', type: :feature do

  it 'should show individual project details' do
    challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000000)
    project = challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
    project2 = challenge.projects.create!(name: "Fitlit", material: "Shade Lamps")

    visit "/projects/#{project.id}"

    expect(page).to have_content("Project Name: #{project.name}")
    expect(page).to have_content("Project Material: #{project.material}")
    expect(page).to have_content("Theme of Chellenge: #{project.challenge.theme}")

    expect(page).to_not have_content(project2.name)
    expect(page).to_not have_content(project2.material)
  end
end
