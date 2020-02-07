require 'rails_helper'

RSpec.describe 'As a visitor to project show page', type: :feature do

  before(:each) do
    @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000000)
    @project = @challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
    @project2 = @challenge.projects.create!(name: "Fitlit", material: "Shade Lamps")
    @contestant = @project.contestants.create!(name: "Tron Kat", age: 30, hometown: "Dallas", years_of_experience: 2)
    @contestant2 = @project.contestants.create!(name: "Kat Tron", age: 29, hometown: "Denver", years_of_experience: 4)
  end

  it 'should show individual project details' do
    visit "/projects/#{@project.id}"

    expect(page).to have_content("Project Name: #{@project.name}")
    expect(page).to have_content("Project Material: #{@project.material}")
    expect(page).to have_content("Theme of Chellenge: #{@project.challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 3")

    expect(page).to_not have_content(@project2.name)
    expect(page).to_not have_content(@project2.material)
  end
end
