# Flutter Authentication App

[Click Here to watch the demo](https://youtu.be/akrLnnI3-Cc).


This is a Flutter-based mobile application with Firebase authentication. The app includes features like login, signup, Google login, and a splash screen with animations or a GIF.

## Features

- **Splash Screen**: Displays an animation or GIF when the app starts.
- **Firebase Authentication**:
  - Email/Password login and signup.
  - Google Sign-In integration.
- **Secure Credential Handling**: All user credentials are managed securely using Firebase Authentication.

## Technologies Used

- **Flutter**: Framework for building cross-platform mobile apps.
- **Firebase Authentication**: For user management and authentication.
- **Google Sign-In**: To allow users to log in with their Google accounts.
- **Lottie / Flare for Animations**: (If using animations on the splash screen)
  
## Getting Started

### Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install).
- Install Firebase CLI tools (`firebase-tools`).
- Set up a Firebase project in the [Firebase Console](https://console.firebase.google.com/).

### Firebase Setup

1. Go to your [Firebase Console](https://console.firebase.google.com/), create a new project, and add your app (Android/iOS).
2. Download the `google-services.json` file (for Android) and `GoogleService-Info.plist` (for iOS) and add them to your respective directories in the project:
   - `android/app/` (for `google-services.json`)
   - `ios/Runner/` (for `GoogleService-Info.plist`).
3. Enable **Email/Password** and **Google Sign-In** methods in the Firebase Authentication section.

### Project Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/flutter-auth-app.git
   cd flutter-auth-app

2. Install dependencies:
  flutter pub get
3. Run the app:
  flutter run


### Dependencies
 - firebase_auth: For Firebase Authentication.
 - google_sign_in: For Google login integration.
 - lottie: (Optional) For splash screen animations.


