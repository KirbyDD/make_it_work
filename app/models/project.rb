class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def num_of_contestants
    self.contestants.count
  end

  def avg_experience
    self.contestants.reduce(0) { |acc, contestant| acc + contestant[:years_of_experience]} / contestants.count
  end
end
