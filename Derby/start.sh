#!/bin/bash
docker run -d -p 1527:1527 -v derby_db_volume:/storage --name derby_db plopezm/db/derby