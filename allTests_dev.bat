@echo off

REM This script is used to run all tests in the current directory and its subdirectories.
REM It will create a log file with the results of each test.

robot --variablefile dev.py *.robot