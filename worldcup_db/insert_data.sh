#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


POPULATE_DATA=true


if [[ $POPULATE_DATA == true ]]
then

  # truncate all
  echo $($PSQL "TRUNCATE teams, games;")

  # no need to title

  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != year ]]
    then


      # b. insert teams
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      # not found
      if [[ -z $WINNER_ID ]]
      then

        # insert into teams
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_TEAM == "INSERT 0 1" ]]
        then
          echo Inserted into majors, $WINNER
        fi
        
        # get id
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      fi

      echo $WINNER_ID



      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      # not found
      if [[ -z $OPPONENT_ID ]]
      then

        # insert into teams
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_TEAM == "INSERT 0 1" ]]
        then
          echo Inserted into majors, $OPONENT
        fi

        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi

      echo $OPPONENT_ID


      # c. insert games
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

      if [[ $INSERT_GAME = "INSERT 0 1" ]]
      then
        echo Game successfully inserted!
      else
        echo Error trying to insert game!
      fi

    fi

  done
fi










# Total number of goals in all games from winning teams:


