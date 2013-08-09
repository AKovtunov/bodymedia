module Bodymedia
  class Client
    def get_goals(type, *args)
      if args.length == 0
        get_parsed_data "/goal/#{type}"
      else
        get_parsed_data "/goal/#{type}/#{args[0]}"
      end
    end
    def get_current_goals
      get_parsed_data "/goal/current"
    end
  end
end