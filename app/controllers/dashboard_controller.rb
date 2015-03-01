class DashboardController < ApplicationController
	before_filter :authenticate_player!

	def index
		@question = { youtube_id: 'kt0g4dWxEBo', options: ["1", "2", "3"]}
	end

	def new
		# require 'rss'
  #       @rss = RSS::Parser.parse(open('http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile').read, false)
  #      	@rss.items.each do |item|
  #      		"#{item.pubDate} - #{item.title}"
  #      	end
	end

	def edit
	end


end
