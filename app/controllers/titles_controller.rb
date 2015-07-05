class TitlesController < ApplicationController

  get '/titles' do
    @titles = Title.all
    erb :"/titles/index"
  end

  get '/titles/new' do
    @figures = Figure.all
    erb :"/titles/new"
  end

  post '/titles' do
    Title.create(params[:title])
    redirect "/titles"
  end

  get '/titles/:id' do
    @title = Title.find(params[:id])
    erb :"/titles/show"
  end

  get '/titles/:id/edit' do
    @figures = Figure.all
    @title = Title.find(params[:id])
    erb :"/titles/edit"
  end

  patch '/titles/:id' do
    @title = Title.find(params[:id])
    @title.update(params[:title])
    redirect "/titles/#{@title.id}"
  end
end
