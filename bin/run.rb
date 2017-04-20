require 'pry'
require_relative '../lib/market.rb'
require_relative '../lib/participant.rb'
require_relative '../lib/second-price-auction.rb'
require_relative '../lib/first-price-auction.rb'


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
  puts
  puts "First, we need to define the market."
  market = Market.new
  market.get_participants
  market.get_preferences
end

def auction_type(auction_types)
  puts "Please choose the type of auction you want to simulate"
  puts
  puts "Available Auction Types:"
  auction_types.each_with_index { |auction_type, index| puts "#{index + 1} - #{auction_type}"}
  puts
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


auction_types = ["Sealed-Bid First-Price", "Sealed-Bid Second-Price (Vickrey)"]

welcome
type = auction_type(auction_types)
define_market

again = 'y'
while again == 'y'
  auction = set_auction(type)
  puts
  puts "The final price of the auction is #{auction.winning_price}."
  puts
  puts "#{auction.auction_winner} your are the winner!!!"
  puts
  puts "Would you like to run a different auction with same market? (y/n)"
  again = gets.chomp.to_s
  type = auction_type(auction_types) if again == "y"
end

puts
puts "GoodBye ..."
