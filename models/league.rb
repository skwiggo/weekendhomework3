require_relative('match')
require_relative('team')

class League

  attr_accessor :matches, :teams

  def initialize
    @matches = Match.all()
    @teams = Team.all()
  end

  def home_team_scores()
    return @matches
  end

















end