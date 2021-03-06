#!/bin/sh

cmd="spanner-cli -i test-instance -d testdb -p $PROJECT"

cat <<'EOD' | $cmd

CREATE TABLE Singers (
  SingerId STRING(36) NOT NULL,
  FirstName STRING(200),
  LastName STRING(200) NOT NULL,
  FullName STRING(400) AS (COALESCE(FirstName || ' ', '') || LastName) STORED,
) PRIMARY KEY(SingerId);

CREATE TABLE Albums (
  AlbumId STRING(36) NOT NULL,
  Title STRING(100) NOT NULL,
  SingerId STRING(36) NOT NULL,
) PRIMARY KEY(AlbumId);

CREATE TABLE Tracks (
  AlbumId STRING(36) NOT NULL,
  TrackId INT64 NOT NULL,
  Title STRING(200) NOT NULL,
) PRIMARY KEY(AlbumId, TrackId),
INTERLEAVE IN PARENT Albums ON DELETE CASCADE;

EOD
