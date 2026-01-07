📖 Introduction

The Personal Task Manager is a simple mobile application built using the Flutter framework.
The application allows users to manage daily tasks by adding, editing, completing, and deleting tasks.
This project was developed without using any backend service or database, and all data is stored temporarily in memory during runtime, as required by the assignment.
🎯 Features
Splash / Welcome Screen
View list of tasks
Add a new task with title and description
Edit existing tasks
Mark tasks as completed
Delete tasks with confirmation dialog
Snackbar messages for user feedback
Clean and user-friendly interface

🧭 Application Screens

The application consists of the following screens:
Splash Screen
Home Screen (Task List)
Add Task Screen
Edit Task Screen
Delete Confirmation Dialog
Technologies Used
Flutter
Dart
Android Studio
Material Design Widgets

🧩 State Management
The application uses StatefulWidget and setState() for state management.
Tasks are stored in a List<Map<String, dynamic>> during runtime.
No database or local storage is used.
Validation & User Experience
Task title cannot be empty
Snackbar messages are shown for user actions
Alert dialog is used to confirm task deletion
Visual indicators for completed tasks

Screenshots
Splash Screen
Home Screen (No Tasks)
Add Task Screen
Home Screen (With Tasks)
Edit Task Screen
Completed Task
Delete Confirmation
How to Run the Project

Clone the repository:git clone https://github.com/your-username/personal-task-manager.git
Navigate to the project folder:cd personal-task-manager
Get dependencies:flutter pub get
Run the app:flutter run
