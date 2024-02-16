#!/bin/bash

# Check if students-list_1023.txt exists
if [[ ! -f "students-list_1023.txt" ]]; then
  echo "No student records found."
  exit 1
fi

# Use awk to select only the first field (student email) and save to student-emails.txt
awk -F ' ' '{print $1}' "students-list_1023.txt"| sort > "student-emails.txt"

echo "Student emails saved to student-emails.txt."

