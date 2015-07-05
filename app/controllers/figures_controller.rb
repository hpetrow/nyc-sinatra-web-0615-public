class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/new"
  end

  post '/figures' do
    Figure.create(params[:figure])
    redirect "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    redirect "/figures/#{@figure.id}"
  end
end
