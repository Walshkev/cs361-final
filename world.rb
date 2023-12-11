class World
    def initialize(name, things)
      @name = name
      @features = things
    end
      def add_feature(f)
        @features.append(t)
      end
    
      #changed from to_json to get_json to have the same name as the other methods 
      def get_json(indent=0)
        # Write stuff
        #changed s to json_string to remove single letter variables to help with redability 
        json_string = '{"type": "FeatureCollection","features": ['
        @features.each_with_index do |feature,i|
          if i != 0
            json_string  +=","
          end
            #removed the if track or waypoint and utalized the interface i created using the same name for the function 
          # changed from to_json to get_json 
          json_string  += feature.get_json
          
        end
        json_string  + "]}"
      end
    end
    