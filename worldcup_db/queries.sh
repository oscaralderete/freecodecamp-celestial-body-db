#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(g1) FROM ( SELECT SUM(winner_goals) AS g1 FROM games UNION SELECT SUM(opponent_goals) AS g1 FROM games ) AS total ")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND( AVG(winner_goals), 2 ) FROM games" )"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG( g ) FROM ( SELECT (winner_goals + opponent_goals) AS g FROM games) AS tot" )"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(g1) FROM ( SELECT MAX(winner_goals) AS g1 FROM games UNION SELECT MAX(opponent_goals) AS g1 FROM games ) AS total ")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2" )"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM games LEFT JOIN teams ON games.winner_id=teams.team_id WHERE year=2018 AND round='Final'"  )"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT t FROM ( SELECT name AS t FROM games LEFT JOIN teams ON games.winner_id=teams.team_id WHERE round='Eighth-Final' AND year=2014 UNION SELECT name as t FROM games LEFT JOIN teams ON games.opponent_id=teams.team_id WHERE round='Eighth-Final' AND year=2014 ) AS tot ORDER BY t  "  )"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT teams.name FROM games LEFT JOIN teams ON games.winner_id=teams.team_id GROUP BY teams.name ORDER BY teams.name"  )"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM games LEFT JOIN teams ON games.winner_id=teams.team_id WHERE round='Final' ORDER BY year" )"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT t FROM ( SELECT name AS t FROM games LEFT JOIN teams ON games.winner_id=teams.team_id WHERE name LIKE 'Co%' UNION SELECT name as t FROM games LEFT JOIN teams ON games.opponent_id=teams.team_id WHERE name='Co%' ) AS tot ORDER BY t  "  )"
