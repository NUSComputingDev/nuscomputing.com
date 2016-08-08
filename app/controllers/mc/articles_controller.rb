class Mc::ArticlesController < Mc::BaseController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all.order("created_at desc")
	end

	def show
		@articles = Article.all.order("created_at desc")
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to [:mc, @article], notice: "Article is successfully created" }
				format.json { render json: @article, status: :created, location: @article }
			else
				format.html { render 'new' }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to mc_article_path
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to mc_articles_path
	end

	private
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :content)
	end
end
