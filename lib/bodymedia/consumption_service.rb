module Bodymedia
  class Client

    def get_consumption_for_today(*args)
      return get_consumption_for(date_now, args)
    end

    def get_consumption_for(day, *args)
      if args.length == 0
        return get_parsed_data "/consumption/#{day}"
      else
        return get_parsed_data "/consumption/micro/#{day}" if args.include?(:micro)
        return get_parsed_data "/consumption/macro/#{day}" if args.include?(:macro)
      end
    end

    def get_consumption_for_period(start_date, end_date, *args)
      if args.length == 0
        get_parsed_data "/consumption/#{start_date}/#{end_date}"
      else
        return get_parsed_data "/consumption/day/#{start_date}/#{end_date}" if args.include?(:daily)
        return get_parsed_data "/consumption/day/macro/#{start_date}/#{end_date}" if args.include?(:macro) and args.include?(:daily)
        return get_parsed_data "/consumption/day/micro/#{start_date}/#{end_date}" if args.include?(:micro) and args.include?(:daily)
        return get_parsed_data "/consumption/day/meal/#{start_date}/#{end_date}" if args.include?(:meal)
        #return get_parsed_data "/consumption/day/meal//food/#{start_date}/#{end_date}" if args.include?(:meal) and args.include?(:food)
        #return get_parsed_data "/consumption/day/meal/food/#{start_date}/#{end_date}" if args.include?(:meal) and args.include?(:food)
      end
    end

  end
end
