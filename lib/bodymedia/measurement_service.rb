module Bodymedia
  class Client

    def get_measurements(param, *dates)
      if dates.length == 0
        get_parsed_data "/measurement/#{param}"
      else
          get_parsed_data "/measurement/#{param}/#{dates[0]}"
      end
    end
    def get_current_measurements
      get_parsed_data "/measurement/current"
    end
    #http://api.bodymedia.com/v2/heartrate/[zones]/day/[zones]/session/[zones]/detail/[zones]/{startDate}/[{endDate}]
  end
end
#GET, POST  /measurement/[WAISTLINE|WEIGHT]
#The user's most recent weight or waistline measurement.
#GET, POST, DELETE  /measurement/[WAISTLINE|WEIGHT]/{date}
#The user's weight or waistline measurement on the specified date.
#GET  /measurement/current
#The user's most recent weight and waistline measurements.