require 'open-uri'
require 'RSS'

		hiphop_feeds = [
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

		def ingest_feed(url, category)
			open(url) do |rss|
				feed = RSS::Parser.parse(rss)
				#title = feed.channel.title.gsub(/\AUploads\sby\s/, '').gsub('VEVO', '')
				feed.items.each do |item| 
					nametitle = item.title.split('-')
					name = nametitle.first.strip
					title = nametitle.last.strip
					guid = item.guid
					videoid = guid.to_s.split(":").last.split("<").first
					# require 'pp'
					# pp item

					puts name, title
					artist_params = {
						name: name,
						rss_url: url,
						category: category
					}
					artist = Artist.find_or_create_by(artist_params)

					question_params = {
						text: "What video is this?",
						youtube_id: videoid, #changed videoid: from youtube_id:, system said it was an UnknownAttributeError
						artist: artist	
					}
					question = Question.create(question_params)

					option_params = {
						text: title,
						correct: true,
						question: question
					}
					options = Option.create(option_params)
				end
			end
		end


namespace :pf do
	task runfeed: :environment do
		hiphop_feeds.each do |feed_url|
			ingest_feed(feed_url, Category.find_or_create_by(name: "Hip Hop"))
		end

		# randb_feeds.each do |feed_url|
		# 	ingest_feed(feed_url, Category.find_or_create_by(name: "R&B"))
		# end
	end	
end




