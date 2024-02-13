#!/bin/bash

STUDENTS_FILE="students-list_1023.txt"

while true; do
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Enter your choice (1-5): " choice

    echo  # Empty line for separation

    case $choice in
        1)  # Create student record
            read -p "Enter student email: " email
            read -p "Enter student age: " age
            read -p "Enter student ID: " student_id

            # Check for existing records with the same email or student ID
            if grep -E "^$email\s|\s$student_id$" "$STUDENTS_FILE" > /dev/null; then
                echo "Student record with the same email or student ID already exists. Cannot create duplicate records."
            else
                echo "$email $age $student_id" >> "$STUDENTS_FILE"
                echo "Student record created and saved."
            fi
            ;;

        2)  # View all students
            if [ -s "$STUDENTS_FILE" ]; then
                cat "$STUDENTS_FILE"
                echo  # Empty line for separation
            else
                echo "No students found."
            fi
            ;;

        3)  # Delete student record
            read -p "Enter student ID to delete: " delete_id
            sed -i "/^$delete_id\s/d" "$STUDENTS_FILE"
            echo "Student record with ID $delete_id deleted."
            ;;

        4)  # Update student record
            read -p "Enter student ID to update: " update_id
            read -p "Enter new email: " new_email
            read -p "Enter new age: " new_age

            # Update the entire line
            sed -i "/^$update_id\s/c$new_email $new_age $update_id" "$STUDENTS_FILE"
            echo "Student record with ID $update_id updated."
            ;;

        5)  # Exit the application
            echo "Exiting the application."
            exit 0
            ;;

        *)  # Invalid choice
            echo "Invalid choice. Please enter a number between 1 and 5."
            ;;
    esac
done
