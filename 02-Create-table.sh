#!/bin/sh

cmd="spanner-cli -i test-instance -d testdb -p $PROJECT"

cat <<'EOD' | $cmd

CREATE TABLE Singers (
        SingerId   INT64 NOT NULL,
        FirstName  STRING(1024),
        LastName   STRING(1024),
        SingerInfo BYTES(MAX)
) PRIMARY KEY (SingerId);

CREATE TABLE Albums (
        SingerId     INT64 NOT NULL,
        AlbumId      INT64 NOT NULL,
        AlbumTitle   STRING(MAX)
) PRIMARY KEY (SingerId, AlbumId),
INTERLEAVE IN PARENT Singers ON DELETE CASCADE;

EOD
