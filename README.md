# Group Chat Application

## Overview

This project is a Group Chat Application built with Flutter, using Firebase for real-time database functionality and user authentication. The app features a clean and modern UI, enabling users to create and join group chats, send real-time messages, and enjoy a seamless chatting experience. It leverages Firebase for secure data storage and message synchronization across devices.

## Features

- **Firebase Authentication**: User registration and login using Firebase Authentication.
- **Real-Time Messaging**: Messages are sent and received in real-time using Firebase Cloud Firestore.
- **Group Chats**: Users can create and join multiple group chats.
- **Clean UI**: A user-friendly interface with a focus on simplicity and responsiveness.
- **Message Time Stamps**: Each message shows the time it was sent.
- **User Profile**: Users have personalized profiles with display names.
- **Message Notifications**: Real-time updates for new messages.

## Tech Stack

- **Flutter**: Frontend framework for building cross-platform applications.
- **Firebase Authentication**: To manage user sign-up, login, and authentication.
- **Firebase Cloud Firestore**: For real-time data storage and message syncing.
- **Firebase Cloud Messaging (FCM)**: For sending push notifications to users about new messages.
- **Provider Package**: For state management throughout the app.
- **Google Fonts**: For clean and elegant font integration.

# Getting Started

## Prerequisites
To run this project, you need to have:
- **Flutter SDK installed**: Flutter Installation Guide
- **A Firebase account**: Firebase Console
- Basic knowledge of Flutter and Firebase.

## Setup Instructions

1. **Clone the Repository**
 ```bash
   git clone https://github.com/your-username/group_chat_app.git
```
   
2.**Navigate to the Project Directory**
   ```bash
   cd group_chat_app
```
3.**Install Dependencies Run the following command to install all necessary dependencies**:
   ```bash
   flutter pub get
```
4.**Firebase Setup**
- Go to the Firebase Console.
- Create a new Firebase project.
- Enable Firebase Authentication and Cloud Firestore in your project.
- **Download the google-services.json file for Android or GoogleService-Info.plist for iOS and place them in their respective directories**:
   - For Android: Place google-services.json in android/app/.
   - For iOS: Place GoogleService-Info.plist in ios/Runner/.

5.**Run the Application You can run the app on an emulator or a physical device using**:
   ```bash
   flutter run
```

## Folder Structure
```bash
├── android                    # Android specific files
├── ios                        # iOS specific files
├── lib
│   ├── models                 # Data models (e.g., user, message)
│   ├── services               # Firebase services (authentication, messaging, database)
│   ├── screens                # UI screens (Login, Group Chat, Profile, etc.)
│   ├── providers              # State management using Provider package
│   ├── widgets                # Reusable UI components (Chat bubble, buttons, etc.)
│   └── main.dart              # Application entry point
├── pubspec.yaml               # Flutter dependencies and assets
├── README.md                  # Project documentation
└── assets                     # Fonts and image assets
```

## Dependencies

- **firebase_core**: Core Firebase package for Flutter apps.
- **firebase_auth**: Handles Firebase authentication services.
- **cloud_firestore**: Firestore database for storing chat messages.
- **provider**: State management for managing app-wide state.
- **google_fonts**: Custom fonts to enhance the UI

## Future Enhancements

- **Push Notifications**: Add push notifications for new message alerts.
- **User Status**: Show online/offline status of users.
- **Media Sharing**: Allow users to share images and videos in chats.
- **Direct Messaging**: Implement one-on-one messaging functionality.

## Screenshots

- **USER 1**
![sample Output](https://github.com/Praveen5102/Groupchat/blob/main/lib/assets/back.png)

- **USER 2**
![sample Output](https://github.com/Praveen5102/Groupchat/blob/main/lib/assets/icon.png)


## Contribution Guidelines

We welcome contributions to this project! If you'd like to contribute:

1. Fork the repository.
2. Create a feature branch (git checkout -b feature-branch-name).
3. Commit your changes (git commit -m 'Add some feature').
4. Push to the branch (git push origin feature-branch-name).
5. Open a pull request.


## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For any questions or feedback, feel free to reach out:
- **Email**: praveenkumargone229@gmail.com
- **GitHub**: https://github.com/praveen5102

## 

Thank you for checking out the Group Chat Application! We hope you enjoy using it as much as we enjoyed building it. 😊







   
