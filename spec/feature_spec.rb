require 'oystercard'
require 'station'

card = Oystercard.new

p card.balance
card.top_up(5)
p card.balance
card.top_up(80)
p card.balance
