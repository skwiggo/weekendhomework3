require('pg')
require_relative('../db/sql_runner')

class Team

  attr_accessor(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def Team.all()
    sql = "SELECT * FROM teams;"
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Team.new(team)}
    return result
  end

  def Team.find(id)
    sql = "SELECT * from teams where id = #{@id}"
    team = SqlRunner.run(sql).first
    return Team.new(team)
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING *;"
    team = SqlRunner.run(sql).first
    @id = team['id'].to_i
  end

  def home_team_matches()
    sql = "SELECT * FROM matches WHERE home_team_id = #{@id};"
    matches = SqlRunner.run(sql)
    result = matches.map {|match| Match.new(match)}
    return result
  end

  def away_team_matches()
    sql = "SELECT * FROM matches WHERE home_team_id = #{@id};"
    matches = SqlRunner.run(sql)
    result = matches.map {|match| Match.new(match)}
    return result
  end

  def update()
    sql = "UPDATE teams SET 
    name ='#{@name}',
    WHERE id = #{@id} RETURNING *;"
    SqlRunner.run(sql)
    return self
  end

  def delete()
    sql = "DELETE FROM teams WHERE id = #{@id}"
    SqlRunner.run(sql)
    return nil
  end
end