#!/bin/bash

# Ensure we always run relative to the script's location (strudel/songs)
cd "$(dirname "$0")" || exit

# Define cleanup function
cleanup() {
  echo "Shutting down servers..."
  kill $SERVER1_PID $SERVER2_PID 2>/dev/null
  wait $SERVER1_PID $SERVER2_PID 2>/dev/null
  exit 0
}

# Trap Ctrl+C (SIGINT) and call cleanup
trap cleanup SIGINT

# Start server in base/server
cd ../server || exit
pnpm dev &
SERVER1_PID=$!

# Start server in base/samples
cd ../samples || exit
pnpm dlx @strudel/sampler &
SERVER2_PID=$!

# Give the servers a little time to start
sleep 3

# Open the website in the default browser
if command -v open >/dev/null; then
  open "http://localhost:4321/"
else
  echo "Please open http://localhost:4321/ manually"
fi

# Keep script alive until servers stop (or Ctrl+C is pressed)
wait $SERVER1_PID $SERVER2_PID