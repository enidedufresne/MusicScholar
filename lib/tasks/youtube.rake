require 'open-uri'
require 'rss'

		hiphop_feeds = [
			'http://gdata.youtube.com/feeds/base/users/50CentVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/PitbullVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LudacrisVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/JColeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/RickRossVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/NickiMinajAtVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LilWayneVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/KanyeWestVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/EminemVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/TygaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/2ChainzVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/2PacVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/DrakeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'			
		]
		
		pop_feeds = [
			'http://gdata.youtube.com/feeds/base/users/AdeleVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/OneDirectionVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/CarlyRaeJepsenVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/fionaappleVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/keshaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/30SecondsToMarsVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/TaylorSwiftVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/MileyCyrusVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/KatyPerryVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/SelenaGomezVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/shakiraVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/BritneySpearsVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LadyGagaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/JustinBieberVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/michaeljacksonVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/LMFAOVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/BeckVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/DemiLovatoVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
		]
		
		randb_feeds = [
			'http://gdata.youtube.com/feeds/base/users/MaryJBligeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/MariahCareyVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/RobinThickeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/aliciakeysVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/AloeBlaccVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/johnlegendVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/kellyrowlandVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/CAguileraVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/RihannaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/NeYoVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/FergieVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/CiaraVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/justintimberlakeVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/beyonceVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/ChrisBrownVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
		]

		electronic_feeds = [
			'http://gdata.youtube.com/feeds/base/users/davidguettavevo/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
		]

		rock_feeds = [
			'http://gdata.youtube.com/feeds/base/users/Maroon5VEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/GunsNRosesVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/BobDylanVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/BonJoviVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/U2VEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/SherylCrowVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/NirvanaVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile',
			'http://gdata.youtube.com/feeds/base/users/OneRepublicVEVO/uploads?alt=rss&v=2&orderby=published&client=ytapi-youtube-profile'
		]

		def ingest_feed(url, category)
			open(url) do |rss|
				feed = RSS::Parser.parse(rss)
				#title = feed.channel.title.gsub(/\AUploads\sby\s/, '').gsub('VEVO', '')
				feed.items.each do |item| 
					nametitle = item.title.split('-')
					name = nametitle.first.strip #Artist name
					title = nametitle.last.strip #Song title
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
						youtube_id: videoid,
						artist: artist	
					}
					question = Question.create(question_params)

					option_params = {
						text: title,
						correct: true,
						question: question
					}
					Option.create(option_params)

					options_chosen = []

					randomized_options = Option.joins(:question => :artist).shuffle

					selected_options = randomized_options.first(3)

					selected_options.each do |option|
						unless options_chosen.include?(option)
							new_option = Option.create(
								text: option.text,
								correct: false,
								question: question
							)
							options_chosen << new_option
						end
						
					end
				end
			end
		end


namespace :pf do
	desc 'Load all the external media feeds'
	task runfeed: :environment do
		hiphop_feeds.each do |feed_url|
			ingest_feed(feed_url, Category.find_or_create_by(name: "Hip Hop"))
		end

		randb_feeds.each do |feed_url|
			ingest_feed(feed_url, Category.find_or_create_by(name: "R&B"))
		end

		pop_feeds.each do |feed_url|
			ingest_feed(feed_url, Category.find_or_create_by(name: "Pop"))
		end

		electronic_feeds.each do |feed_url|
			ingest_feed(feed_url, Category.find_or_create_by(name: "Electronic"))
		end

		rock_feeds.each do |feed_url|
			ingest_feed(feed_url, Category.find_or_create_by(name: "Rock"))
		end
	end	
end




