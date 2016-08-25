#Personal script for making new entries into the misc repo
#SYNTAX:
#SCRIPT file language problem
FILE=$1
LANGUAGE=$2
PROBLEM=$3

PROJECT_DIRECTORY="YOUR PROJECT DIRECTOR HERE"
BY_LANGUAGE_DIR="$PROJECT_DIRECTORY/by-language/$2/"
BY_PROBLEM_DIR="$PROJECT_DIRECTORY/by-problem/$3/$2/"

cp "$1" "$BY_LANGUAGE_DIR"
cp "$1" "$BY_PROBLEM_DIR"
