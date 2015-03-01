require 'open-uri'
require 'RSS'
namespace :youtube do
	desc "TODO"
	task pullfeed: :environment do
		url = 'http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
		items = []
		open(url) do |rss|
			feed = RSS::Parser.parse(rss)
			#puts "Title: #{feed.channel.title}"
			feed.items.each do |item|
				guid = item.guid
				videoid = guid.to_s.split(":").last.split("<").first
				Question.create(
					text: "What video is this?", 
					youtube_id: videoid
					# artist_id: 
					)
			end
		end

	end

	# task pull: :environment do
	# 	Artist.all.each do |artist|
	# 		name = artist.name #something
	# 		url = 'http://gdata.youtube.com/feeds/base/users/#{name}VEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
	# 	end
	# end

end
# <%
# url = 'http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
# items = []
# open(url) do |rss|
# 	feed = RSS::Parser.parse(rss)
# 	puts "Title: #{feed.channel.title}"
# 	feed.items.each do |item|
# 		items << item
# 		# Question.create(text: "What video is this?", youtube_id: item.videoid)
# 	end
# end
# %>