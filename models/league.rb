class League

  attr_accessor :matches, :teams

  def initialize(matches, teams)
    @matches = matches
    @teams = teams
  end

  def home_team_scores()
    return @matches['home_team_score']
  end

















end