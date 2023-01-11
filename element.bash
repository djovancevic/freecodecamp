#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]]
then
    echo Please provide an element as an argument.
    exit
else
    #take argument from terminal
    ELEMENT_TO_SELECT=$1
    #GET AVAILABLE ELEMENTS FROM DB
    AVAILABLE_ELEMENTS=$( $PSQL "SELECT atomic_number, symbol, name FROM elements ORDER BY atomic_number")
    echo "$AVAILABLE_ELEMENTS" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
    do 
      #check if exist ELEMENT_TO_SELECT in AVAILABLE_ELEMENTS BY ATOMIC_NUMBER, SYMBOL OR NAME
      if [[ $ELEMENT_TO_SELECT == $ATOMIC_NUMBER || 
            $ELEMENT_TO_SELECT == $SYMBOL ||
            $ELEMENT_TO_SELECT == $NAME ]]
      then
        ELEMENT_PROPERTIES=$( $PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type
                                  FROM properties AS p INNER JOIN types AS t USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER ")
        #echo element properties
        echo "$ELEMENT_PROPERTIES" | while read ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
        do
          #echo element selected properties
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
          break 2
        done   #here after break 2
        exit 6
      fi    
    done
    if [[ ! $? == 6 ]]
    then
      echo "I could not find that element in the database."
    fi
fi
