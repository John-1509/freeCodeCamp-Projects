#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"

# welcome block
WELCOME(){
  echo -e "\nEnter your username:"
  read USER_NAME
  
  # check user
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USER_NAME'")
  if [[ -z $USER_ID ]]
  then
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    USER_ID=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME') RETURNING user_id")
  else
    local GAME_COUNT BEST_GUESS
    USER_DATA=$($PSQL "SELECT COUNT(game_id), MIN(guess_count) FROM user_games WHERE user_id = $USER_ID")
    IFS="|" read -r GAME_COUNT BEST_GUESS <<< "$USER_DATA"
    echo "Welcome back, $USER_NAME! You have played $GAME_COUNT games, and your best game took $BEST_GUESS guesses."
  fi
  # start the game
  GAME $USER_ID $USER_NAME
}


GAME(){

  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

  echo -e "\nGuess the secret number between 1 and 1000:"
  
  GUESS_COUNT=0
  while [[ true ]]
  do
    read GUESS

    ((GUESS_COUNT++))

    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      break
    fi
  done
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
  INSERT_NEW_GAME=$($PSQL "INSERT INTO user_games(user_id, user_name, guess_count) VALUES($1, '$2', $GUESS_COUNT)")
}

WELCOME
