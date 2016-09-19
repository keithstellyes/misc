#!/usr/bin/env bash
#Gets a catfact
#Demonstrates JSON API usage

#Download the raw JSON, then get the value we want (at key:facts)
STR="$(curl -s http://catfacts-api.appspot.com/api/facts | jq '.facts' -M)"

#Get length of string for trimming the extraneous
STR_LEN="${#STR}"

#Trim it down to remove the extraneous output chars
let STR_LEN-=8

#Get the non-backslashes removed output (jq prints out the \
OUT_STR=${STR:5:$STR_LEN}

#Print the final string, but get rid of backslashes
echo ${OUT_STR//\\/}
