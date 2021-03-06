#!/bin/sh

set -e

# TODO: Validate custom files passed as args
validate_input() {
  if ! [ -f input.txt ]; then
    echo "Missing input.txt"
    echo "Creating input.txt"
    touch input.txt
    echo "Add address in each line to yellow_number start the search. Example: 'Rua Legal, 123, São Paulo'"
    exit 1
  fi

  if ! [ -s input.txt ]; then
    echo "Input.txt is blank"
    echo "Add address in each line to yellow_number start the search."
    echo "Example: 'Rua Legal, 123, São Paulo'"
    exit 1
  fi
}

wait_selenium_server() {
  while ! nc -z selenium 4444; do
    echo "Waiting Selenium Server..."
    sleep 1
  done
}


validate_input
wait_selenium_server

exec bundle exec "$@"

