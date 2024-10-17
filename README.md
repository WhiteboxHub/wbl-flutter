# WBL Flutter App README

This is a Flutter project designed to run on both Android and iOS devices. Follow the instructions below to clone and run the project on Windows and Mac.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
- [Android Studio](https://developer.android.com/studio) installed (for Android development).
- [Xcode](https://developer.apple.com/xcode/) installed (for iOS development, Mac only).
- [Flutter Getting Started](https://docs.flutter.dev/get-started/install/macos/mobile-ios), (for macOS environment, IOS development)

## Cloning the Repository

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the repository.
3. Run the following command to clone the repository:

   ```sh
   git clone https://github.com/WhiteboxHub/wbl-flutter.git
   ```

4. Navigate into the project directory:

   ```sh
   cd wbl-flutter
   ```

## Running the Project

### For Windows (Android)

1. Connect your Android device to your computer or start an Android emulator.
2. Ensure that your device is recognized by running:

   ```sh
   adb devices
   ```

3. Navigate to the project directory and run the following command to get the dependencies:

   ```sh
   flutter pub get
   ```

4. Run the project on the connected Android device or emulator:

   ```sh
   flutter run
   ```

### For Mac (Android and iOS)

#### Running on Android

1. Connect your Android device to your computer or start an Android emulator.
2. Ensure that your device is recognized by running:

   ```
   adb devices
   ```

3. Navigate to the project directory and run the following command to get the dependencies:

   ```
   flutter pub get
   ```

4. Run the project on the connected Android device or emulator:

   ```
   flutter run
   ```

#### Running on iOS

1. Open the project in Xcode by navigating to the `ios` directory and opening the `Runner.xcworkspace` file:

   ```
   open ios/Runner.xcworkspace
   ```

2. Select a simulator or connect your iOS device.
3. Navigate to the project directory and run the following command to get the dependencies:

   ```
   flutter pub get
   ```

4. Run the project on the connected iOS device or simulator:

   ```
   flutter run
   ```

## Troubleshooting

- If you encounter issues with dependencies, try running `flutter clean` and then `flutter pub get`.
- Ensure that your Flutter SDK is up to date by running `flutter upgrade`.
- For iOS, make sure you have the necessary provisioning profiles and certificates set up in Xcode.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
