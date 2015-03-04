require 'open-uri'
require 'RSS'

namespace :pf do
	task runfeed: :environment do
		feeds = [
			'http://gdata.youtube.com/feeds/base/users/kellyrowlandVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile', 
			'http://gdata.youtube.com/feeds/base/users/50CentVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LudacrisVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/JColeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/RickRossVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/NeYoVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/CiaraVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/MaryJBligeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/aliciakeysVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/johnlegendVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/BeckVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/MileyCyrusVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/justintimberlakeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/FergieVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LadyGagaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/michaeljacksonVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/AdeleVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/NickiMinajAtVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LilWayneVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/KanyeWestVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/EminemVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/DrakeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/fionaappleVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/ChrisBrownVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/DemiLovatoVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LMFAOVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/davidguettavevo/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/KatyPerryVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/JustinBieberVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/TaylorSwiftVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/beyonceVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
		]

		def ingest_feed(url)
			open(url) do |rss|
				feed = RSS::Parser.parse(rss)
				#title = feed.channel.title.gsub(/\AUploads\sby\s/, '').gsub('VEVO', '')
				feed.items.each do |item| 
					title = item.title.split('-').first.strip
					guid = item.guid
					videoid = guid.to_s.split(":").last.split("<").first

					# question_params = {
					# 	text: "What video is this?" 	
					# }

					# puts title
					# artist_params = {
					# 	name: title,
					# 	rssurl: url
					# }
					
					# Artist.create(artist_params)
					# video_params = {
					# 	youtube_id: videoid, #changed videoid: from youtube_id:, system said it was an UnknownAttributeError
					# 	artist_id: Artist.find_by_name(title).id
					# }

					# video = Video.new(video_params)
					# video.save!
					# video.questions.create(question_params)
					# # question.options

					

					Question.create(
					text: "What video is this?", 
					youtube_id: videoid
					# artist_id: 
					)

					# video = Video.create(video_params)
					# current_question = Question.create(question_params)

					# video.questions.push(current_question)
					# question.options
				end
			end
		end

		feeds.each do |feed_url|
			ingest_feed(feed_url)
		end
	end	
end




# require 'open-uri'
# require 'RSS'
# namespace :youtube do
# 	desc "Create questions from a YouTube feed."
# 	task pullfeed: :environment do
# 		youtube_url = 'http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
# 		open(youtube_url) do |rss|
# 			feed = RSS::Parser.parse(rss)
# 			#puts "Title: #{feed.channel.title}"
# 			feed.items.each do |item|
# 				guid = item.guid
# 				videoid = guid.to_s.split(":").last.split("<").first
# 				Question.create(
# 					text: "What video is this?", 
# 					youtube_id: videoid
# 					# artist_id: 
# 					)
# 			end
# 		end
# 	end
# end
