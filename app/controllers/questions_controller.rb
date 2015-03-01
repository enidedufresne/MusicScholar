class QuestionsController < ApplicationController
	
	def index
    require 'rss'
        @rss = RSS::Parser.parse(open('http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile').read, false)
        @rss.items.each do |item|
        	puts "#{item.pubDate} - #{item.title}"
        end
	end

	def new
		@question = Question.new
		@question = { youtube_id: 'kt0g4dWxEBo', options: ["1", "2", "3"]}
	end

	def edit
		@questions = @artist.find_by_id params[:id]
	end

	def artist_question
		@questions = @artist.questions
	end
end
