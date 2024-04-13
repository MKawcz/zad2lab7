#!/bin/bash

echo "Testing connection to Frontend..."
curl -s http://localhost:80 > /dev/null
if [ $? -eq 0 ]; then
  echo "Success: Connected to Frontend."
else
  echo "Failure: Cannot connect to Frontend."
fi

echo "Testing connection from Frontend to Backend..."
curl -s http://localhost/api > /dev/null
if [ $? -eq 0 ]; then
  echo "Success: Frontend to Backend connection is okay."
else
  echo "Failure: Frontend cannot connect to Backend."
fi

echo "Testing connection to Backend directly..."
curl -s http://localhost:3000/ > /dev/null
if [ $? -eq 0 ]; then
  echo "Success: Direct connection to Backend is working."
else
  echo "Failure: Cannot connect directly to Backend."
fi

echo "Testing connection from Backend to Database..."
docker-compose exec backend node db_test.js
if [ $? -eq 0 ]; then
  echo "Success: Backend can connect to Database."
else
  echo "Failure: Backend cannot connect to Database."
fi
