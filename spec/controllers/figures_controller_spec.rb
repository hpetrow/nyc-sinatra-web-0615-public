require 'spec_helper'

describe FiguresController do
  before do
    Figure.create(name: 'Robert Moses')
  end

  after do
    Figure.destroy_all
  end

  it "allows you to create a new figure" do
    post '/figures', {:figure => {:name => "New Name"}}
    expect(Figure.last.name).to eq("New Name")
  end

  it "allows you to list all figures" do
    get '/figures'
    expect(last_response.body).to include(Figure.last.name)
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single figure" do
    @figure = Figure.first.id
    get "/figures/#{@figure}"
    expect(last_response.status).to eq(200)
  end
end
