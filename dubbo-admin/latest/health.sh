#!/bin/bash
LOOP_SIZE=10
i=0

while [[ $i -lt LOOP_SIZE ]]; do
	status_code=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost:8080/swagger-resources)

  if [[ "$status_code" -eq 200 ]] ; then
    echo "health check passed!"
    exit 0
  else
    curl -v http://localhost:8080/swagger-resources
    echo "status is incorrect, waiting for next turn"
  fi
	sleep 10
	i=$i+1
done

echo "health check failed!"
exit 1

