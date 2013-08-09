module Bodymedia
  class Client

  	def get_heartrate_for_period(start_date, end_date, *args)
  		if args.length == 0
  			get_parsed_data "/heartrate/#{start_date}/#{end_date}"
  		else
        return get_parsed_data "/heartrate/day/#{start_date}/#{end_date}" if args.include?(:daily)
        return get_parsed_data "/heartrate/day/session/#{start_date}/#{end_date}" if args.include?(:session)
        return get_parsed_data "/heartrate/day/session/detail/#{start_date}/#{end_date}" if args.include?(:detailed)
  		end
  	end

    #http://api.bodymedia.com/v2/heartrate/[zones]/day/[zones]/session/[zones]/detail/[zones]/{startDate}/[{endDate}]
  end
end