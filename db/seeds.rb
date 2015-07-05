l0 = Landmark.create(name: "BQE", year_completed: "1961")
l1 = Landmark.create(name: "Holland Tunnel", year_completed: "1927")
l2 = Landmark.create(name: "Wall Street Wall", year_completed: "1685")

figure_list = [
  "Robert Moses",
  "Al Smith",
  "Theodore Roosevelt",
  "Peter Stuyvesant",
  "Boss Tweed"
].collect do |figure|
  Figure.create(name: figure)
end

title_list = [
  "Mayor",
  "President",
  "Governor",
  "NYC Parks commissioner"
].collect do |title|
  Title.create(name: title)
end

l0.figure = figure_list[0]
l1.figure = figure_list[1]
l2.figure = figure_list[2]
l0.save
l1.save
l2.save

FigureTitle.create(:figure => figure_list[0], :title => title_list[0])
FigureTitle.create(:figure => figure_list[1], :title => title_list[1])
FigureTitle.create(:figure => figure_list[2], :title => title_list[2])
FigureTitle.create(:figure => figure_list[3], :title => title_list[3])
