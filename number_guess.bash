#!/bin/bash 
# Number Guessing Game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  echo "Enter your username:"
  read NAME
  # check if USER is in the database
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
  # greeting the player
  if [[ ! $USER_ID ]]
  then 
    echo "Welcome, $NAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$NAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
    GAMES_PLAYED=0
  else 
    USERNAME=$($PSQL "SELECT username FROM users WHERE user_id=$USER_ID")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  GUESS_GAME
}

ENTER_GUESSES() {
  #if not INTEGER
  echo "$TEXT_PROMPT"
  read USERS_GUESS
  if [[ ! $USERS_GUESS =~ ^[0-9]+$ ]] #|| [[ $USERS_GUESS -lt 1 ]] || [[ $USERS_GUESS -gt 1000 ]]
  then
    TEXT_PROMPT="That is not an integer, guess again: "
    ENTER_GUESSES
  else
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES += 1))
  fi
}

INSERT_RESULTS() {
  GAMES_PLAYED=$((GAMES_PLAYED += 1))
  RESULTS_INSERTED=$( $PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE user_id = $USER_ID")
}

GUESS_GAME() {
  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
  NUMBER_OF_GUESSES=0
  #enter the first guess
  TEXT_PROMPT="Guess the secret number between 1 and 1000: "
  ENTER_GUESSES
  #while loop is SUBSHELL
  while [ ! $SECRET_NUMBER == $USERS_GUESS ]
  do
    # echo "SECRET NUMBER: $SECRET_NUMBER"
    # echo "USERS GUESS: $USERS_GUESS"
    if [[ $SECRET_NUMBER -lt $USERS_GUESS ]]
    then
      #if SECRET_NUMBER < USERS_GUESS
      TEXT_PROMPT="It's lower than that, guess again:"
    elif [[ $SECRET_NUMBER -gt $USERS_GUESS ]]
    then
      #if SECRET_NUMBER > USERS_GUESS
      TEXT_PROMPT="It's higher than that, guess again:"
    fi
    ENTER_GUESSES
  done
  #if SECRET_NUMBER = USERS_GUESS
  echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!
  #check if it is BEST_GAME
  if [[ $NUMBER_OF_GUESSES -gt $BEST_GAME ]]
  then
    BEST_GAME=$NUMBER_OF_GUESSES
  fi
  INSERT_RESULTS
}

DELETE_FROM_DB() {
  DELETE_FROM_GAMES=$( $PSQL "DELETE FROM games;")
  DELETE_FROM_USERS=$( $PSQL "DELETE FROM users;")
}

if [[ $1 == 1 ]]
then
  DELETE_FROM_DB
fi
MAIN

