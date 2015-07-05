class Figure <ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, :through => :figure_titles

  def landmark_by_name=(name)
    self.landmarks << Landmark.find_or_create_by(name: name)
  end

  def title_by_name=(name)
    self.figure_titles.build(title: Title.find_or_create_by(name: name))
  end

  def add_landmarks_by_name=(names)
    names.split(',').each{|name|
      self.landmark_by_name = name.strip
    }
  end

  def add_titles_by_name=(names)
    names.split(',').each{|name|
      self.title_by_name = name.strip
    }
  end
end
