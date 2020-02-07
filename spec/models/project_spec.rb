require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe 'methods' do
    before(:each) do
      @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000000)
      @project = @challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
      @contestant = @project.contestants.create!(name: "Tron Kat", age: 30, hometown: "Dallas", years_of_experience: 2)
      @contestant2 = @project.contestants.create!(name: "Kat Tron", age: 29, hometown: "Denver", years_of_experience: 4)

    end
    it 'num_of_contestants' do
      expect(@project.num_of_contestants).to eq(2)
    end

    it 'avg_experience' do
      expect(@project.avg_experience).to eq(3)
    end
  end
end
