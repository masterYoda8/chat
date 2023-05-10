#!/bin/bash

source .env

# Define your API key and the endpoint URL
ENDPOINT="https://api.openai.com/v1/completions"

MAX_TOKENS=1500

# Make the API call using curl
response=$(curl --silent -X POST -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d '{
    "model": "text-davinci-003",
    "prompt": "'"$1"'",
    "max_tokens": '$MAX_TOKENS'
  }' $ENDPOINT)

# Parse and extract the generated text from the API response
generated_text=$(echo "$response" | jq -r '.choices[0].text')

# Print the generated text
echo "$generated_text"


