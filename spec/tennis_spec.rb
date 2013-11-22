require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to be(game.player2) 
      expect(game.player2.opponent).to be(game.player1)
    end  
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new
    player.opponent.opponent = player

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq('forty')
      end
    end

    context 'when both players have 3 points' do
      it 'returns duece' do
        player.points = 3
        player.opponent.points = 3

        expect(player.score).to eq('duece')
        expect(player.opponent.score).to eq('duece')
      end
    end

    context 'when one player has 4 points and opponent has 2 points' do
      it 'returns game' do
        player.points = 4
        player.opponent.points =2

        expect(player.score).to eq('game')
      end
    end 

    context 'when one player has 5 points and opponent has 4 points' do
      it 'returns advantage' do
        player.points = 5
        player.opponent.points = 4

        expect(player.score).to eq('advantage')
      end
    end   

    context 'when one player has 6 points and opponent has 4 points' do
      it 'returns game' do
        player.points = 6
        player.opponent.points = 4

        expect(player.score).to eq('game')
      end
    end 

    context 'when both players have 7 points' do
      it 'returns duece' do
        player.points = 7
        player.opponent.points = 7

        expect(player.score).to eq('duece')
      end
    end

    context 'when one player has 10 points and opponent has 8 points' do
      it 'returns game' do
        player.points = 10
        player.opponent.points = 8

        expect(player.score).to eq('game')
      end
    end 
  end
end