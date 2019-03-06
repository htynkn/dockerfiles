sleep 60

status_code=$(curl --write-out %{http_code} --silent --output /dev/null http://admin:8080/swagger-resources)

if [[ "$status_code" -ne 200 ]] ; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi