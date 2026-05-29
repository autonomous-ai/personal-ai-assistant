#!/bin/bash
# Usage: ./search.sh '{"query":"...", "num_results": 5}'

CONFIG="/root/openclaw/openclaw.json"
API_KEY=$(jq -r '.providers[0].apiKey' "$CONFIG")
BASE_URL=$(jq -r '.providers[0].baseUrl' "$CONFIG")

# Ensure BASE_URL ends with /
[[ "${BASE_URL}" != */ ]] && BASE_URL="${BASE_URL}/"

curl -s --compressed -X POST "${BASE_URL}tools/exa-search" \
  -H "Content-Type: application/json" \
  -H "x-api-key: ${API_KEY}" \
  -d "$1"
