#!/bin/bash

# Create the directory name
directory_name="negpod_6-q1"

# Check if the directory already exists, if not, create it
if [ ! -d "$directory_name" ]; then
    mkdir "$directory_name"
fi

# Move all four files created in Question 1 to the directory
mv main.sh Students-list_1023.txt Select-emails.sh student-emails.txt "$directory_name"

