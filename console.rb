require_relative('./models/match')
require_relative('./models/team')

require('pry-byebug')

team1 = Team.new({'name' => 'Edinburgh Clowns'})
team2 = Team.new({'name' => 'Glasgow Apes'})
team3 = Team.new({'name' => 'Aberdeen Sheep'})
team4 = Team.new({'name' => 'Fife Goats'})

team1.save()
team2.save()
team3.save()
team4.save()

match1 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_team_score' => 1, 'away_team_score' => 0})
match2 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team1.id, 'home_team_score' => 0, 'away_team_score' => 2})
match3 = Match.new({'home_team_id' => team4.id, 'away_team_id' => team2.id, 'home_team_score' => 2, 'away_team_score' => 4})
match4 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team4.id, 'home_team_score' => 3, 'away_team_score' => 2})

match1.save()
match2.save()
match3.save()
match4.save()



binding.pry
nil
