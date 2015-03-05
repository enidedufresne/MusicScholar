class FactController < ApplicationController
	before_filter :authenticate_player!
end
