#!/bin/bash
gcloud beta spanner instances create test-instance --config=regional-us-central1 --processing-units=100 --description=test
gcloud beta spanner databases create --instance=test-instance testdb
