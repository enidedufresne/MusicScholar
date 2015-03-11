class HomeController < ApplicationController
	def index
		if player_signed_in?
			redirect_to :controller=> 'dashboard', :action => 'index'	
		end
	end

	def index2
	end

	def show
	end

	def new
	end

	def index
	end
end
