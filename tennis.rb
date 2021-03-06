module Tennis
  class Game
    attr_accessor :player1, :player2

    # Creates two players in a Tennis game and assign them 
    # as oppenents of each other.
    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - represents the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      winner.points += 1
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'duece' if @points == @opponent.points && @points >= 3
      return 'forty' if @points == 3
      return 'game' if @points >= 4 && @opponent.points <= (@points - 2) 
      return 'advantage' if @points == (@opponent.points + 1) && @points >= 3
    end
  end
end