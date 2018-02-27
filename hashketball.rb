# Write your code here!
# require "pry"

def game_hash
  {hashketball =
    :home =>
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
      [
        {player_name:"Alan Anderson",number: 0,shoe: 16,points: 22,rebounds: 12,assists: 12,steals: 3,blocks: 1,slam_dunks: 1},
        {player_name:"Reggie Evans",number: 30,shoe: 14,points: 12,rebounds: 12,assists: 12,steals: 12,blocks: 12,slam_dunks: 7},
        {player_name:"Brook Lopez",number: 11,shoe: 17,points: 17,rebounds: 19,assists: 10,steals: 3,blocks: 1,slam_dunks: 15},
        {player_name:"Mason Plumlee",number: 1,shoe: 19,points: 26,rebounds: 12,assists: 6,steals: 3,blocks: 8,slam_dunks: 5},
        {player_name:"Jason Terry",number: 31,shoe: 15,points: 19,rebounds: 2,assists: 2,steals: 4,blocks: 11,slam_dunks: 1}
      ]
    },
    :away =>
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
      [
        {player_name:"Jeff Adrien",number: 4,shoe: 18,points: 10,rebounds: 1,assists: 1,steals: 2,blocks: 7,slam_dunks: 2},
        {player_name:"Bismak Biyombo",number: 0,shoe: 16,points: 12,rebounds: 4,assists: 7,steals: 7,blocks: 15,slam_dunks: 10},
        {player_name:"DeSagna Diop",number: 2,shoe: 14,points: 24,rebounds: 12,assists: 12,steals: 4,blocks: 5,slam_dunks: 5},
        {player_name:"Ben Gordon",number: 8,shoe: 15,points: 33,rebounds: 3,assists: 2,steals: 1,blocks: 1,slam_dunks: 0},
        {player_name:"Brendan Haywood",number: 33,shoe: 15,points: 6,rebounds: 12,assists: 12,steals: 22,blocks: 5,slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(player)
  find_the_player(player).fetch(:points)
end

def shoe_size(player)
  find_the_player(player).fetch(:shoe)
end

def team_colors(team_name)
  team = find_the_team(team_name)
  team.fetch(:colors)
end

def team_names
  array =[]
  array.push(game_hash[:home][:team_name])
  array.push(game_hash[:away][:team_name])
end

def player_numbers(team_name)
  find_the_team(team_name)[:players].map do |player|
    player[:number]
  end
end

def player_stats(player)
  find_the_player(player).reject { |key, value| value == player }
end

def big_shoe_rebounds
  player_biggest_shoe.fetch(:rebounds)
end

def most_points_scored
  players.sort_by {|player| player.fetch(:points)}.last.fetch(:player_name)
end

def winning_team
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  players.sort_by {|player| player.fetch(:player_name).length}.last.fetch(:player_name)
end

def long_name_steals_a_ton?
  player_steals = players.sort_by {|player| player.fetch(:steals)}.last.fetch(:player_name)
  if player_steals == player_with_longest_name
    true
  else
    false
  end
end



def home_points
  home_players = game_hash.fetch(:home).fetch(:players)
  home_points = home_players.map {|player| player.fetch(:points)}
  home_points.inject(0) {|sum,x| sum + x }
end

def away_points
  away_players = game_hash.fetch(:away).fetch(:players)
  away_points = away_players.map {|player| player.fetch(:points)}
  away_points.inject(0) {|sum,x| sum + x }
end

def players
  home_players = game_hash.fetch(:home).fetch(:players)
  away_players = game_hash.fetch(:away).fetch(:players)
  home_players + away_players
end

def player_biggest_shoe
  players.sort_by {|player| player.fetch(:shoe)}.last
end

def find_the_player(name)
  players.find {|player| player.fetch(:player_name) == name}
end

def find_the_team(team_name)
  game_hash.values.find {|team| team.fetch(:team_name) == team_name}
end

puts long_name_steals_a_ton?
