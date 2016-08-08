class ArticlesController < ApplicationController
	before_action :set_article, only: :show

	def index
		@articles = Article.all.order("created_at desc")
	end

	def show
	end

	private
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :content)
	end
end
