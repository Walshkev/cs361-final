#!/usr/bin/env ruby
require_relative 'track.rb'
require_relative 'waypoint.rb'
require_relative 'world.rb'
require_relative 'tracksegment.rb'
require_relative 'point.rb'

def main()
  w = Waypoint.new(-121.5, 45.5, 30, "home", "flag")
  w2 = Waypoint.new(-121.5, 45.6, nil, "store", "dot")
  ts1 = [
  Point.new(-122, 45),
  Point.new(-122, 46),
  Point.new(-121, 46),
  ]

  ts2 = [ Point.new(-121, 45), Point.new(-121, 46), ]

  ts3 = [
    Point.new(-121, 45.5),
    Point.new(-122, 45.5),
  ]

  t = Track.new([ts1, ts2], "track 1")
  t2 = Track.new([ts3], "track 2")

  world = World.new("My Data", [w, w2, t, t2])

  puts world.get_json()
end

if File.identical?(__FILE__, $0)
  main()
end




# in all i changed the names of veriables form single letters to discriptive words to help with redability 
#changed the names of simmilar methods to the same name to opporate the same without a if statement in gis 
# broke up the gis file to differnt class files and requied them in the gis file to help encapulation and redability. 
# made multiy line setting of variables to one line to help with redability. 
#

