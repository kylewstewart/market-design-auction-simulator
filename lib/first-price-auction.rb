require 'pry'

class FirstPriceAuction

  def bids
    Participant.all.collect {|participant| participant.bid}
  end

  def auction_winner
    Participant.all.select {|participant| participant.bid == bids.max}[0].name
  end

  def winning_price
    bids.max
  end

end
