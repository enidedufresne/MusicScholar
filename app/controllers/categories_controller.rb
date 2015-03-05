class CategoriesController < ApplicationController
	before_filter :authenticate_player!
	
	def new
		@category = Category.new
	end

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
	end

	def choose_artist
		@categories = @artist.categories
	end
end
