@echo off
REM run_tests.bat - Script to run RSpec tests on Windows

echo.
echo ================================
echo 🧪 Running RSpec Unit Tests
echo ================================
echo.

REM Check if rspec is installed by running it
rspec --version >nul 2>&1

if errorlevel 1 (
    echo ❌ RSpec not found. Installing...
    gem install rspec
)

echo Running all tests...
echo.

REM Run all tests with formatting
rspec --color --format documentation

echo.
echo ================================
echo ✓ Test run complete!
echo ================================
