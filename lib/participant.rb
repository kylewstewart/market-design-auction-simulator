require 'pry'

class Participant

  attr_accessor :name, :bid

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def add_bid(bid)
    @bid = bid
  end

end
