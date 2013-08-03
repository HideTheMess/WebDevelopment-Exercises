# -*- coding: utf-8 -*-

class Card
  attr_reader :suit

  @@SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  @@VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  @@POKER_VALUES = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

  def self.suits
    @@SUIT_STRINGS.keys
  end

  def self.values
    @@VALUE_STRINGS.keys
  end

  def initialize(suit, value)
    @suit, @value = suit, value
  end

  def value
    @@POKER_VALUES[@value]
  end

  def to_s
    "#{ @@VALUE_STRINGS[@value] } #{ @@SUIT_STRINGS[@suit] }"
  end

end