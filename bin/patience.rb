#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__) + '/../lib'
require 'game'
require 'deck'

deck = Deck.full
game = Game.new

game.lay(deck)
print game.output_aces
print game.output_table


# Game play knows several phases:
# Loop:
#   1) Check table to see what you can do within the table
#   2) Check if any cards can be put away to aces
# If no more:
#   3) Next card, back to 1)
#
#   4) Repeat if no stalemate
