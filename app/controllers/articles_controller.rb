class ArticlesController < ApplicationController
	before_action :authenticate_user!, except => [:index, :show]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
 
  		@article.save
  		redirect_to @article
	end

	def show
  		@article = Article.find(params[:id])
	end

	def index
		if params[:tag]
			@articles = Article.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 2)
		else
  			@articles = Article.paginate(:page => params[:page], :per_page => 2)
  		end
	end

	def destroy
		@article = Article.find(params[:id]).destroy

		flash[:danger] = "Artikel '#{@article.title}' wurde gelöscht!"

		redirect_to :action => 'index'
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash[:info] = "Artikel '#{@article.title}' wurde aktualisiert!"

		redirect_to article_path(@article)
	end

end
