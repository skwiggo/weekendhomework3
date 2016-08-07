require('minitest/autorun')
require_relative('../league')

class LeagueTest < Minitest::Test

  def setup()
    @league = League.new()
  end

  def test_return_total_home_team_scores
    assert_equal(4, @league.home_team_scores)
  end



end