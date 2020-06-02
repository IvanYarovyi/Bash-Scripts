#!/bin/bash

# This script is usefull when we need to know if a web-app is successfully deployed (by performing health check)

# Usually webb-applications are long-running processes, they do not return exit code after start
# Luckily, some of them has HTTP endpoinds for monitoring (Spring Boot Actuator for instance)

# The scrips returns 0 if an apllication has been started successfuly

DELAY_IN_SECS_BEETWEEN_CALLS=10
ATTEMPTS_COUNT=20
APPLICATION_MONITOR_URL="http://localhost:8080/monitor/health"
USER_NAME="user1"
PASSWORD="pass12"
BASE64_AUTH_STRING=$(echo "$USER_NAME:$PASSWORD" | base64)

# Makes GET REST CALL and parses json
# Returns - 'UP', 'DOWN' or ''
function get_web_app_status() {
  curl --silent --location --request \
    GET $APPLICATION_MONITOR_URL \
    --header "Authorization: Basic $BASE64_AUTH_STRING" |
    jq -r '.status'
}

for i in $(seq 1 $ATTEMPTS_COUNT); do
  echo "Attempt #$i "
  status=$(get_web_app_status)
  if [ "$status" = "UP" ]; then
    echo "Application check is successful. Application's status is UP."
    exit 0
  elif [[ "$status" == "DOWN" ]]; then
    echo "Application status is $status"
  else
    echo "Can't get application status"
  fi
  echo "Wait $DELAY_IN_SECS_BEETWEEN_CALLS second and check status again."
  sleep $DELAY_IN_SECS_BEETWEEN_CALLS
done

echo "Application check is failed. We made $ATTEMPTS_COUNT ATTEMPTS_COUNT and all of them was unsuccessful." 1>&2
exit 1
