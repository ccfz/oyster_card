require 'pry'
require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'
require_relative './lib/journey.rb'
require_relative './lib/journeylog.rb'

oyster = Oystercard.new(Journeylog)
aldgate = Station.new('aldgate', 2)
kings_cross = Station.new('kings cross', 1)
moorgate = Station.new('moorgate', 4)
journeylog = Journeylog.new
oyster.check_balance


p :t1
oyster.top_up(10)
p oyster.check_balance

p :t2
oyster.touch_out(aldgate)
p oyster.check_balance
p oyster.log

p :t3
oyster.touch_in(kings_cross)
p oyster.check_balance
p oyster.log

p :t4
oyster.touch_out(moorgate)
p oyster.check_balance
p oyster.log
p :end
