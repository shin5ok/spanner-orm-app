CONN=$(gcloud spanner databases describe testdb --instance=test-instance --format=json | jq .name -r)
gcloud run deploy --source=. spanner-orm-app --set-env-vars=CONN=$CONN --region=us-central1 --no-allow-unauthenticated