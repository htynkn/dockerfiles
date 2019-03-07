#!/bin/bash
status_code=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost:8080/swagger-resources)

if [[ "$status_code" -eq 200 ]] ; then
  exit 0
else
  curl -v http://admin:8080/swagger-resources
  exit 1
fi