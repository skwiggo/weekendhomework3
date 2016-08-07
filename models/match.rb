require('pg')
require_relative('../db/sql_runner')

class Match

  attr_accessor(:id, :home_team_id ,:away_team_id, :home_team_score, :away_team_score)

  def initialize(options)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
  end

  def Match.all()
   sql = "SELECT * FROM matches;"
   matches = SqlRunner.run(sql)
   result = matches.map {|match| Match.new(match)}
   return result
  end

  def Match.find()
    sql = "SELECT * from matches where id = #{@id}"
    match = SqlRunner.run(sql).first
    return Match.new(match)
  end

  def save()
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES (#{@home_team_id}, #{@away_team_id}, #{@home_team_score}, #{@away_team_score}) RETURNING *;"
    matches = SqlRunner.run(sql).first
    @id = matches['id'].to_i
  end

  def home_team()
    sql = "SELECT * FROM teams WHERE id =  #{@home_team_id}"
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Team.new(team)}
    return result
  end

  def away_team()
    sql = "SELECT * FROM teams WHERE id =  #{@away_team_id}"
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Team.new(team)}
    return result
  end

  def update()
    sql = "UPDATE matches SET 
    home_team_score ='#{@home_team_score}',
    away_team_score = '#{@away_team_score}'
    WHERE id = #{@id} RETURNING *;"
    SqlRunner.run(sql)
    return self
  end

  def delete()
    sql = "DELETE FROM matches WHERE id = #{@id}"
    SqlRunner.run(sql)
    return nil
  end

end