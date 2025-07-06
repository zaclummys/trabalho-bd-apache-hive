# Wait for HiveServer2 to be ready
echo "Waiting for HiveServer2 to be ready..."
MAX_TRIES=30
SLEEP_TIME=5
COUNTER=0

until docker exec hive-hive-server-1 bash -c "beeline -u jdbc:hive2://localhost:10000 -e 'SELECT 1'" > /dev/null 2>&1; do
  if [ $COUNTER -ge $MAX_TRIES ]; then
    echo "HiveServer2 not ready after $((MAX_TRIES * SLEEP_TIME)) seconds."
    exit 1
  fi
  echo "HiveServer2 not ready, retrying in $SLEEP_TIME seconds..."
  sleep $SLEEP_TIME
  COUNTER=$((COUNTER + 1))
done

echo "HiveServer2 is ready."