#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/lists"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "list": {
      "name_list": "'"${NAME_LIST}"'",
      "content": "'"${CONTENT}"'",
      "date": "'"${DATE}"'"
    }
  }'

echo
