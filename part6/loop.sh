#!/bin/sh
# loop.sh

race()
{
  while true
  do
    ./vulp < attack_input
  done
}

race
RACE_PID=$!
kill $RACE_PID
