#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n
Welcome to My Salon, how can I help you?\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU() {
AVAILABLE_SERVICE=$($PSQL "SELECT service_id,name FROM services;")
echo "$AVAILABLE_SERVICE" | while IFS=" | " read SERVICE_ID SERVICE_NAME
do
echo -e "$SERVICE_ID) $SERVICE_NAME"
done
read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
if [[ -z $SERVICE_NAME ]]
then
echo "I could not find that service. What would you like today?"
MAIN_MENU
fi
}

MAIN_MENU

echo "What's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
echo  "I don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
$PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
else
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
fi
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME
$PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')"
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."