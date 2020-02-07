require 'rails_helper'

RSpec.describe 'As a visitor to challenge index page', type: :feature do

  it 'should show individual project details' do
    challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000000)
    project = challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
    project2 = challenge.projects.create!(name: "Fitlit", material: "Shade Lamps")
    contestant = project.contestants.create!(name: "Tron Kat", age: 30, hometown: "Dallas", years_of_experience: 2)
    project2.contestants << contestant

    challenge2 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000000)
    project3 = challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
    contestant2 = project3.contestants.create!(name: "Kat Tron", age: 29, hometown: "Denver", years_of_experience: 1)


    visit "/contestants"

    within "#contestant-#{contestant.id}" do
      expect(page).to have_content(contestant.name)
      expect(page).to have_content(project.name)
      expect(page).to have_content(project2.name)
    end

    within "#contestant-#{contestant2.id}" do
      expect(page).to have_content(contestant2.name)
      expect(page).to have_content(project3.name)
    end
  end
end
