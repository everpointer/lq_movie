require 'nokogiri'
require 'open-uri'
require 'net/http'

namespace :grab do

  desc "get ningbo each day's screening movie from douban movie"

  task :douban => :environment do
    puts "start grabbing movies screening in bingbo"
    dom = Nokogiri::HTML open(screening_url)

    d_movie_list = dom.at('div#showing-now')

    movie_id_list = parse_movie_id_list(d_movie_list)

    puts "grabbed id_list is " + movie_id_list.join(',')
    puts "finish grabbing and start fetching movie info"

    success =  failure = 0
    # clear formar screening flag
    Movie.reset_screening
    # insert screening movie
    movie_id_list.each do |id|
      movie_info = fetch_movie_info(id)
      ## try fetch twice
      unless movie_info
        puts "faild to fetch movie info with id:#{id}, refetch again"
        movie_info = fetch_movie_info(id)
      end
      if movie_info
        success+=1
        puts "succeed to fetch movie info with id:#{id}"
        create_movie(id, movie_info)
      else
        failure+=1
        puts "faild to fetch movie info with id:#{id}"
      end
    end
    puts "finish fetch movie info, #{success} succeed and #{failure} fail"
  end


  def screening_url(city = :ningbo)
    "http://movie.douban.com/nowplaying/#{city}"
  end

  def parse_movie_id_list(d_movie_list)
    id_list = []
    d_movie_list.css(".item>a").each do |movie|
      id_list << movie.attributes["href"].value.split("/").last
    end
    id_list
  end

  def fetch_movie_info(id)
    movie_info_uri = URI.parse("http://api.douban.com/v2/movie/#{id}") 
    response = Net::HTTP.get_response(movie_info_uri)
    if response.code == "200"
      JSON.parse(response.body)
    else
      nil
    end
  end

  def create_movie(douban_id, movie_info)
    movie = Movie.find_by_douban_id(douban_id)

    if movie.nil?
      movie = {}
      movie["douban_id"] = douban_id
      movie["is_screening"] = true
      movie["title"] = movie_info["title"] 
      movie["image"] = movie_info["image"] 
      movie["director"] = movie_info["attrs"]["director"] 
      movie["cast"] = movie_info["attrs"]["cast"] 
      movie["movie_type"] = movie_info["attrs"]["movie_type"] 
      movie["pubdate"] = movie_info["attrs"]["pubdate"] 
      movie["country"] = movie_info["attrs"]["country"] 
      movie["language"] = movie_info["attrs"]["language"] 
      movie["movie_duration"] = movie_info["attrs"]["movie_duration"][0].slice(%r(\w*)).to_i
      movie["movie_edition"] = movie_info["attrs"]["movie_edition"] 
      movie["rating"] = movie_info["rating"] 
      movie["summary"] = movie_info["summary"] 
      Movie.create(movie)
    else
      movie.is_screening = true
      movie.save
    end
  end

end