#!/bin/bash

# student record
create_student_record() {
    read -p "Enter student email:" email
    read -p "Enter student age:" age
    read -p "Enter student ID:" id
  

    echo "$email,$age,$id" >> students-list_1023.txt
    echo "Student record created successfully."
}

# viewing all students saved in the file
view_all_students() {
    echo "List of all students:"
    cat students-list_1023.txt
}

# deleting a student record by ID
delete_student_record() {
    echo "Enter student ID to delete:"
    read id

    sed -i "/^.*,$id$/d" students-list_1023.txt
    echo "Student record with ID $id deleted successfully."
}

# updating a student record by ID
update_student_record() {
    echo "Enter student ID to update:"
    read id

    echo "Enter updated student email:"
    read email
    echo "Enter updated student age:"
    read age

    sed -i "s/^.*,$id$/$email,$age,$id/" students-list_1023.txt
    echo "Student record with ID $id updated successfully."
}

#menu
while true; do
    echo "     "
    echo "ALU Registration System"
    echo "==============================="
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    echo "--------------------------"
    read -p "Enter your choice: " choice

    if [[ $choice -eq 1 ]]; then
      create_student_record
    elif [[ $choice -eq 2 ]]; then
      view_all_students
    elif [[ $choice -eq 3 ]]; then
      delete_student_record
    elif [[ $choice -eq 4 ]]; then
       update_student_record
    elif [[ $choice -eq 5 ]]; then
    echo "Exiting program. Goodbye!"
       exit
    else
       echo "Invalid choice. Please enter a valid option."
   fi

 done
