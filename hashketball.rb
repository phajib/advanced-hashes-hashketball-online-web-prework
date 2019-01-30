require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
good_practices
=end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == name
        return player_data[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == name
        return player_data[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do|location, team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
  end
end

def team_names
  tName_array = []
  game_hash.each do |location, team_data|
    team_data.each do |team, name|
      if :team_name == team
        tName_array << (name)
      end
    end
  end
  return tName_array
end

def player_numbers(name)
  pNumbers_array = []
   game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      team_data[:players].each do |player_name, num|
        pNumbers_array << num[:number]
      end
    end
  end
  pNumbers_array
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == name
        return player_data
      end
    end
  end
end

def big_shoe_rebounds
  rebound = 0
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:shoe] > shoe_size
        rebound = player_data[:rebounds]
        shoe_size = player_data[:shoe]
      end
    end
  end
  rebound
end

#BONUS

def most_points_scored
  pPoints = 0
  player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:points] > pPoints
        pPoints = player_data[:points]
        player =  player_name
      end
    end
  end
  player
end

=begin
def winning_team
  home_team = 0
  away_team = 0
  game_hash[:home][:players].each do |name, value|
    home_team += value[:points]
  end
  game_hash[:away][:players].each do |name, value|
    away_team += value[:points]
  end
  if home_team > away_team
      game_hash[:home][:team_name]
  elsif home_team < away_team
      game_hash[:away][:team_name]
  else
      "It's a tie!"
  end
end
=end
def winning_team
  home_points = game_hash[:home][:players][:points]
  away_points = game_hash[:away][:players][:points]

  home_total = home_points.sum
  away_total = away_points.sum

  if home_total > away_total
    return game_hash[:home]
  elsif away_total > home_total
    return game_hash[:away]
  elsif home_total.sum == away_total.sum
    return "A tie"
  end
end
