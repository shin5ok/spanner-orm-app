#!/bin/bash
gcloud run deploy --source=. --region=us-central1 --allow-unauthenticated test-spanner-api --project=shingo-ar-gaming --set-env-vars=CONN=$CONN
