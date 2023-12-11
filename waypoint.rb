class Waypoint

      attr_reader :lat, :lon, :ele, :name, :type
    
      def initialize(lon, lat, ele=nil, name=nil, type=nil)
        @lat = lat
        @lon = lon
        @ele = ele
        @name = name
        @type = type
      end
    
        # changed from get_waypoint_json  to get json to work as an interface 
      def get_json(indent=0)
    
        # combined the j= and j+= to help with redability and changed j to temp string to get rid of single letter variables  
        temp_string = '{"type": "Feature","geometry": {"type": "Point","coordinates": '
        # if name is not nil or type is not nil
        # kept this here so it is easy it edit later
        temp_string += "[#{@lon},#{@lat}"
        if ele != nil
          temp_string += ",#{@ele}"
        end
        temp_string += ']},'
        if name != nil or type != nil
          temp_string += '"properties": {'
          if name != nil
            temp_string += '"title": "' + @name + '"'
          end
          if type != nil  # if type is not nil
            if name != nil
              temp_string += ','
            end
            temp_string += '"icon": "' + @type + '"'  # type is the icon
          end
          temp_string += '}'
        end
        temp_string += "}"
        return temp_string
      end
    end