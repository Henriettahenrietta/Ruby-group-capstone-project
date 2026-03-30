#!/bin/bash
# run_tests.sh - Simple script to run RSpec tests

echo "==="
echo " Running RSpec Unit Tests"
echo "==="
echo ""

# Check if rspec is installed
if ! command -v rspec &> /dev/null; then
    echo "RSpec not found. Installing..."
    gem install rspec
fi

echo "Running all tests..."
echo ""

# Run all tests with formatting
rspec --color --format documentation

echo ""
echo "==="
echo "Test run complete!"
echo "==="
