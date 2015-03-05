class OptionController < ApplicationController
	before_filter :authenticate_player!
	
	def new
		@option = Option.new
	end

	def index
		@option = Option.all
	end

	def edit
	end

	def show
		@option = Option.find(params[:id])
	end
	
end
