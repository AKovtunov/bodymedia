module Bodymedia
  class Client

    def get_burn_for_today(*args)
      get_burn_for(date_now,*args)
    end

    def get_burn_for(day, *args)
      if args.length == 0
        return get_parsed_data "/burn/#{day}"
      else 
        return get_parsed_data "/burn/intensity/#{day}" if args.include?(:intensity)
        return get_parsed_data "/burn/day/minute/#{day}" 
        return get_parsed_data "/burn/day/minute/intensity/#{day}" if args.include?(:minutes) and args.include?(:intensity)
      end
    end

    def get_burn_for_period(start_date, end_date, *args)
      if args.length == 0
        return get_parsed_data "/burn/#{start_date}/#{end_date}"
      else 
        return get_parsed_data "/burn/intensity/#{start_date}/#{end_date}" if args.include?(:intensity)
        return get_parsed_data "/burn/day/minute/#{start_date}/#{end_date}" if args.include?(:minutes)
        return get_parsed_data "/burn/day/#{start_date}/#{end_date}" if args.include?(:daily)
        return get_parsed_data "/burn/day/intensity/#{start_date}/#{end_date}" if args.include?(:daily) and args.include?(:intensity)
        return get_parsed_data "/burn/day/minute/intensity/#{start_date}/#{end_date}" if args.include?(:minutes) and args.include?(:intensity)
      end
    end
    
  end
end
