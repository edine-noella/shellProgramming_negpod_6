#!/bin/bash

while true; do
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)  # Create student record
            read -p "Enter student email: " email
            read -p "Enter student age: " age
            read -p "Enter student ID: " student_id
            echo "$email $age $student_id" >> students-list_1023.txt
            echo "Student record created and saved."
            ;;
        2)  # View all students
            if [ -s "students-list_1023.txt" ]; then
                cat students-list_1023.txt
            else
                echo "No students found."
            fi
            ;;
        3)  # Delete student record
            read -p "Enter student ID to delete: " delete_id
            sed -i "/$delete_id/d" students-list_1023.txt
            echo "Student record with ID $delete_id deleted."
            ;;
        4)  # Update student record
            read -p "Enter student ID to update: " update_id
            read -p "Enter new email: " new_email
            read -p "Enter new age: " new_age
            sed -i "s/$update_id.*/$new_email $new_age $update_id/" students-list_1023.txt
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
