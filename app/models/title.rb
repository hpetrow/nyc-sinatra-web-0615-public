class Title <ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, :through => :figure_titles

  def figure_by_name=(name)
    self.figure_titles.build(figure: Figure.find_or_create_by(name: name))
  end

  def add_figures_by_name=(names)
    names.split(',').each{|name|
      self.figure_by_name = name.strip
    }
  end
end
