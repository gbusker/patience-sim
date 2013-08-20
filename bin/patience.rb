#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__) + '/../lib'
require 'game'
require 'deck'

deck = Deck.full
game = Game.new

game.lay(deck)
print game.output_s
