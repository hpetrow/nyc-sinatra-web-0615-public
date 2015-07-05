require 'spec_helper'

describe TitlesController do
  before do
    Title.create(name: 'Mayor')
  end

  after do
    Title.destroy_all
  end

  it "allows you to create a new title" do
    post '/titles', {:title => {:name => "New Name"}}
    expect(Title.last.name).to eq("New Name")
  end

  it "allows you to list all titles" do
    get '/titles'
    expect(last_response.body).to include(Title.last.name)
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single title" do
    @title = Title.first.id
    get "/titles/#{@title}"
    expect(last_response.status).to eq(200)
  end
end
