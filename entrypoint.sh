#!/bin/bash
set -e

# Remove pre-existing rails pids
rm -f /Colchonet/pids/server.pid

# This will exec the main container process (the one declared as CMD in the Dockerfile)
exec "$@"
