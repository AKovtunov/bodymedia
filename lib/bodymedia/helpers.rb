module Bodymedia
  class Client
    ##############################################################################################
    #GETTING DATA
    #url must be like "/summary/day/20120915/20130809"
    #important to have consumer key and @accesstoken (look in client.rb)
    ##############################################################################################
    def get_data url
        @accesstoken.get("http://api.bodymedia.com/v2/json#{url}?api_key=#{@consumer_key}")
    end
    ##############################################################################################
    #PARSING DATA
    #Normally, get_data returns smth like #<Net::HTTPOK 200 OK readbody=true>
    #so, we need to parse it
    ##############################################################################################
    def parse_data data
      JSON.parse(data.body)
    end

    def get_parsed_data url
      data = parse_data get_data(url)
      puts url
      puts data
      puts "=============================================================="
      if data["status"] == "404"
        puts "ERROR"
        raise ArgumentError #NEED TO BE CHANGED
      else
        return data
      end
    end
    
    #GETTING DATE NOW IN A VALID STRING
    def date_now
      y = DateTime.now.year.to_s
      m = DateTime.now.month < 10 ? "0#{DateTime.now.month}" : DateTime.now.month.to_s 
      d = DateTime.now.day < 10 ? "0#{DateTime.now.day}" : DateTime.now.day.to_s 
      return "#{y}#{m}#{d}"
    end

  end
end
