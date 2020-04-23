
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  # NEW
  get '/articles/new' do
    erb :new
  end

  # CREATE
  post '/articles' do
    @article = Article.create(title: params["title"], content: params["content"])

    redirect "/articles/#{@article.id}"
  end

  # INDEX
  get '/articles' do
    @articles = Article.all
    
    erb :index
  end

  # SHOW
  get "/articles/:id" do
    @article = Article.find(params[:id])
    
    erb :show
  end

  # EDIT
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])

    erb :edit
  end

  # UPDATE
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])

    redirect "/articles/#{@article.id}"
  end
  
  # DELETE
  delete "/articles/:id" do
    Article.destroy(params[:id])

    redirect '/articles'
  end
end
