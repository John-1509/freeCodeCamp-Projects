#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")

# Main Menu
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  # display options from table
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # get service number
  read SERVICE_ID_SELECTED

  CHOSEN_SERVICE=$($PSQL "
    SELECT name FROM services 
    WHERE service_id = $SERVICE_ID_SELECTED
  ")

  if [[ -z $CHOSEN_SERVICE ]]
  then
    MAIN_MENU "\nI could not find that service. What would you like today?"
  else
    BOOKING $CHOSEN_SERVICE $SERVICE_ID_SELECTED
  fi
}

BOOKING(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "
    SELECT name FROM customers
    WHERE phone = '$CUSTOMER_PHONE'
  ")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER=$($PSQL "
      INSERT INTO customers(phone, name)
      VALUES
        ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')
    ")
  fi
  CUSTOMER_ID=$($PSQL "
      SELECT customer_id FROM customers
      WHERE phone = '$CUSTOMER_PHONE'
  ")

  echo -e "\nWhat time would you like your $1, $(echo $CUSTOMER_NAME | sed -E 's/^ *| $//g')?"
  read SERVICE_TIME

  BOOKING=$($PSQL "
    INSERT INTO appointments(customer_id, time, service_id)
    VALUES
      ($CUSTOMER_ID, '$SERVICE_TIME', $2)
  ")

  echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| $//g')."
}


MAIN_MENU
