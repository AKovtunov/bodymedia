module Bodymedia
  class Client

    def get_activity_for(day)
      get_parsed_data "/activity/day/#{day}"
    end
    
    def get_activity_for_today
      get_activity_for date_now
    end

    def get_activity_for_period(start_date, end_date)
      get_parsed_data "/activity/day/#{start_date}/#{end_date}"
    end
    
  end
end
