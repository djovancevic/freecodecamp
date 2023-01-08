#! /bin/bash
PSQL_DROP="psql --username=freecodecamp --dbname=postgres -c"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
#get available services
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services
                                ORDER BY service_id;")
I=0
DISPLAY_SERVICES(){
  if [[ $1 == 0 ]]
  then
    #display available services
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME" 
    done
  #ask for service to book
  read SERVICE_ID_SELECTED
  return $SERVICE_ID_SELECTED
  else
    exit 0
  fi                            
}
APPOINTMENT_MENU(){  
  if [[ $1 == 0 ]]
  then
    echo -e "Welcome to My Salon, how can I help you?"
    DISPLAY_SERVICES $I    
    I=$((I+=1))
  elif [[ $1 =~ ^[^1-9] ]] 
  then  
    echo -e "\n$1"
    DISPLAY_SERVICES 0
  else
     exit 0
  fi
  #if not valid input  
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
		APPOINTMENT_MENU "I could not find that service. What would you like today?"
  else 
		SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services
									WHERE service_id = $SERVICE_ID_SELECTED;")
		if [[ -z $SERVICE_NAME_SELECTED ]]
		then
		APPOINTMENT_MENU "I could not find that service. What would you like today?"
		fi  
		#get phone number
		echo -e "\nWhat's your phone number?"
		read CUSTOMER_PHONE  
		CUSTOMER_NAME=$($PSQL "SELECT name FROM customers
							 WHERE phone = '$CUSTOMER_PHONE';")
		#if new create new customer
		if [[ -z $CUSTOMER_NAME ]]
		then
		  #get name
		  echo -e "\nI don't have a record for that phone number, what's your name?"
		  read CUSTOMER_NAME
		  #save customer
		  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")    
		fi
		#get timeslot 
		echo -e "\nWhat time would you like your$SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
		read SERVICE_TIME
		CUSTOMER_ID_SELECTED=$($PSQL "SELECT customer_id FROM customers
							 WHERE phone = '$CUSTOMER_PHONE';")
		INSERT_APPOINTMENTS_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID_SELECTED, $SERVICE_ID_SELECTED)")   
		echo -e "\nI have put you down for a$SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
  fi      
  }

APPOINTMENT_MENU $I