class Landmark <ActiveRecord::Base
  belongs_to :figure
  has_many :figure_titles
  has_many :titles, :through => :figure_titles

  def figure_name=(name)
    self.figure = Figure.find_or_create_by(name: name)
  end
end
