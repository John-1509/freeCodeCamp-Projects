#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN() {
  if [[ -z $1 ]]
  then
    # if no input
    echo "Please provide an element as an argument."
  else
    # fetch element data if it exists
    ELEMENT=$(ELEMENT_HELPER $1)
    
    if [[ -z $ELEMENT ]]
    then
      echo "I could not find that element in the database."
    else
      # The element with atomic number 1 is Hydrogen (H). 
      # It's a nonmetal, with a mass of 1.008 amu. 
      # Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
      while IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done <<< "$ELEMENT"
    fi
  fi
}

ELEMENT_HELPER() {
  # if its number
  if [[ $1 =~ [0-9] ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")

  # if its symbol
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")

  # if its name
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
  fi

  # if there is no match
  if [[ -z $ATOMIC_NUMBER ]]
  then
    exit 2
  else
    # The element with atomic number 1 is Hydrogen (H). 
    # It's a nonmetal, with a mass of 1.008 amu. 
    # Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
    ELEMENT_INFO=$($PSQL "
      SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
      FROM elements
      JOIN properties USING(atomic_number)
      JOIN types USING(type_id)
      WHERE atomic_number = $ATOMIC_NUMBER
    ")
    echo $ELEMENT_INFO
  fi
}


MAIN $1
