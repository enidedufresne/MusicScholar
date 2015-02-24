class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def index
	end

	def edit
		@categories = @questions.find_by_id parms[:id]
	end

	def ask_question
		@categories = @questions.categories
	end
end
