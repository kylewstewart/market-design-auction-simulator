require 'pry'

class Market

  attr_accessor :number, :participants

  ALL = []

  def initialize
    @participants = []
    ALL << self
  end

  def self.all
    ALL
  end

  def get_participants
    self.number = get_number
    get_names
  end

  def get_number
    n = 0
    while n < 3
      puts "Enter number of participants (must be at leats 3 to be interesting):"
      n = gets.chomp.to_i
      puts "Which part of MUST BE 3 did you not understand?" if n < 3
    end
    self.number = n
  end

  def get_names
    puts "OK, now lets enter out names"
    self.number.times do |n|
      puts "Participant #{n + 1} enter your name:"
      name = gets.chomp
      self.participants << Participant.new(name)
    end
  end

  def get_preferences
    Participant.all.each {|participant| get_bid(participant)}
  end

  def get_bid(participant)
    puts "#{participant.name} please enter your bid (include decimal):"
    bid = gets.chomp.to_f
    confirm_bid(participant.name, bid)
    puts "Thank you #{participant.name}, now AVERT your eyes!"
    participant.bid = bid
  end

  def confirm_bid(name, bid)
    confirm = "n"
    while confirm != "y"
      puts "#{name}, please confirm your bid is #{bid} (y/n):"
      confirm = gets.chomp
    end
  end

end
