class Track
  
    def initialize(segments, name=nil)
      @name = name
      segment_objects = []
      #renamed the variable s to segment to help redability 
      segments.each do |segment|
        segment_objects.append(TrackSegment.new(segment))
      end
      # set segments to segment_objects
      @segments = segment_objects
    end
  
    # changed from get_track_json  to get json to work as an interface 
    def get_json()
      #combined all of the j+= into one line and changed j to tempstring to get rid of single letter variables 
    
      temp_string = '{"type":"Feature", '
      if @name != nil
        #combined all of the j+= into one line 
        temp_string+= '"properties": { "title":"' + @name + '" },'
       
      end
      #combined all of the j+= into one line 
      temp_string += '"geometry": {"type": "MultiLineString",''"coordinates": ['
   
  
      # Loop through all the segment objects
      @segments.each_with_index do |segment, index|
        if index > 0
          temp_string += ","
        end
        temp_string += '['
        # Loop through all the coordinates in the segment
        tsj = ''
        #changed c to cordinate to hep with redability 
        segment.coordinates.each do |coordinate|
          if tsj != ''
            tsj += ','
          end
          # Add the coordinate
          tsj += '['
          tsj += "#{coordinate.lon},#{coordinate.lat}"
          if coordinate.ele != nil
            tsj += ",#{coordinate.ele}"
          end
          tsj += ']'
        end
        temp_string+=tsj
        temp_string+=']'
      end
      temp_string + ']}}'
    end
  end