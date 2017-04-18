require 'pry'
require_relative '../lib/market.rb'
require_relative '../lib/participant.rb'
require_relative '../lib/second-price-auction.rb'


def welcome
  puts "Shall we play a game? (y/n)"
  play_game = gets.chomp.to_s.downcase

  while play_game != "y" && play_game != "n"
    puts "Invalid Input, Try Again!"
    play_game = gets.chomp.to_s.downcase
  end

  if play_game == "n"
    puts "Goodbye"
    exit
  end

  puts "Excellent, lets play Auction Simulator (version 1.0)"
end

def define_market
  puts "First, we need to define the market."
  market = Market.new
  market.get_participants
  market.get_preferences
end

def auction_type(auction_types)
  puts "Great, now choose what type of auction you want to run"
  puts "Available Auction Types:"
  auction_types.each_with_index { |auction_type, index| puts "#{index + 1} - #{auction_type}"}

  puts "Please select an Auction Type (by number):"
  type = gets.chomp.to_i

  while auction_types[type - 1] == nil
    puts "Invalid Selection. Please select an Auction Type (by number)"
    type = gets.chomp.to_i
  end

  puts "Great we are simulating a #{auction_types[type -1]} Auction"
  type
end

def set_auction(type)
  if type == 1
    auction = FirstPriceAuction.new
  elsif type == 2
    auction = SecondPriceAuction.new
  end
  auction
end


auction_types = ["Sealed Bid First Price", "Sealed Bid Second Price (Vickrey)"]

welcome
define_market

while again == 'y'
  type = auction_type(auction_types)
  auction = set_auction(type)

  puts "The final price of the auction is #{auction.winning_price}."
  puts "#{auction.auction_winner} your are the winner!!!"

  puts "Would you like to run a different auction? (y/n)"
  again = gets.chomp.to_s
end

puts "Bye ..."
