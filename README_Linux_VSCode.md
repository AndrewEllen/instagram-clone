# Instagram-Clone

## How to Build the Instagram Clone App Yourself with Visual Studio Code (Linux)

### Pre-requisites

- Linux Operating System
- Visual Studio Code installed
- Git installed

### Step 1 - Install Flutter SDK

1. Follow the [Flutter Install Instructions](https://docs.flutter.dev/get-started/install/linux) to download and install the Flutter SDK on your Linux machine.

2. Add Flutter to your PATH:

    Open your `.bashrc` or `.zshrc` file (depending on your shell) and add the following line to add Flutter to your PATH:
    ```bash
    export PATH="$PATH:`<path_to_flutter_directory>`/flutter/bin"
    ```
    Replace `<path_to_flutter_directory>` with the directory where you've installed Flutter.

3. Run `source ~/.bashrc` or `source ~/.zshrc` to apply the changes immediately.

### Step 2 - Set Up Flutter in Visual Studio Code

1. Open Visual Studio Code.
2. Go to the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of the window.
3. Search for "Flutter" and install the Flutter extension provided by Dart Code.

### Step 3 - Clone the Repo

- **Clone the repo**

  Open the terminal and use the following command to clone the repository:
  ```bash
  git clone git@github.com:AndrewEllen/instagram-clone.git <path>
  ```
  `<path>` specifies the folder to clone into.

- **Download the repo**

  Alternatively, navigate to the repository root [here](https://github.com/AndrewEllen/instagram-clone), click the green "Code" button, and select "Download Zip". Extract the zip file after downloading.

### Step 4 - Open the Project in Visual Studio Code

- Launch Visual Studio Code.
- Go to `File -> Open Folder` and navigate to the `instagram-clone` folder.
- Click "OK" to open the project folder.

### Step 5 - Run Pub Get

- Open the `pubspec.yaml` file inside the project folder.
- You should see a prompt at the top to run `pub get`. Click on it.
  
  If you don't see the prompt, open the terminal inside Visual Studio Code and run:
  ```bash
  flutter pub get
  ```

### Step 6 - Set Up Firebase

Follow the instructions [here](https://firebase.google.com/docs/flutter/setup?platform=android) to set up Firebase with Flutter.

### Step 7 (Optional) - Set Up Firebase Phone Auth

Instructions for setting up phone auth can be found [here](https://firebase.google.com/docs/auth/android/phone-auth).

### Step 8 - Build the App

- Open the terminal inside Visual Studio Code.
- Run the following command to build the APK:
  ```bash
  flutter build apk
  ```

### Step 9 - Copy the APK to Your Device

Navigate to `build/app/outputs/flutter-apk/` to find the `app-release.apk`. Copy this to your Android device for installation.

Run the APK to install the app.