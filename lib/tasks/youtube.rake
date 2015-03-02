require 'open-uri'
require 'RSS'
namespace :youtube do
	desc "TODO"
	task pullfeed: :environment do
		url = 'http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
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
end
