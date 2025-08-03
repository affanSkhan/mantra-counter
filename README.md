# Mantra Counter – Flutter App

A simple and elegant Flutter application designed to help users count mantra repetitions with customizable targets and persistent data storage.

## 📱 Description

The Mantra Counter app provides a clean, user-friendly interface for tracking mantra recitations. Whether you're aiming for the traditional 108 repetitions or setting your own custom target, this app ensures your progress is saved and accessible across sessions.

## ✨ Features

- **Increment Counter**: Tap to count each mantra repetition
- **Reset Counter**: Easily reset your count back to zero
- **Set Custom Target**: Configure your desired repetition goal (default: 108)
- **Target Notifications**: Receive haptic feedback and visual confirmation when target is reached
- **Data Persistence**: Automatically saves your progress using SharedPreferences
- **Smart UI**: Buttons disable appropriately and provide visual feedback
- **Input Validation**: Robust validation for target setting with user-friendly error messages
- **Responsive Design**: Works seamlessly on different screen sizes

## 🛠️ Tech Stack

- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language
- **shared_preferences**: Local data persistence
- **Material Design 3**: Modern UI components

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed on your machine
- Android Studio or VS Code with Flutter extensions
- An Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mantra_counter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📸 Screenshots

*Screenshots will be added here*

<!-- Add your app screenshots here -->
<!-- ![Home Screen](screenshots/home_screen.png) -->
<!-- ![Target Dialog](screenshots/target_dialog.png) -->
<!-- ![Target Reached](screenshots/target_reached.png) -->

## 🎥 Demo Video

*Demo video will be available here*

<!-- [Watch Demo Video](link-to-demo-video) -->

## 🏗️ Project Structure

```
lib/
├── main.dart          # Main application entry point
pubspec.yaml           # Project dependencies and configuration
```

## 📋 Development Phases

This project was developed in 6 structured phases:

1. **Phase 1**: Basic Flutter app structure and UI layout
2. **Phase 2**: Clean and responsive UI design
3. **Phase 3**: Core functionality implementation
4. **Phase 4**: Data persistence with SharedPreferences
5. **Phase 5**: Testing, validation, and error handling
6. **Phase 6**: Documentation and finalization

## 🎯 Usage

1. **Counting**: Tap the "Count" button to increment your mantra counter
2. **Setting Target**: Tap "Set Target" to configure your desired repetition goal
3. **Resetting**: Use the "Reset" button to start over
4. **Target Achievement**: When you reach your target, the app will vibrate and show a celebration message

## 🔧 Key Components

- **StatefulWidget**: Manages app state and user interactions
- **SharedPreferences**: Persists counter and target values locally
- **Material UI**: Provides consistent and modern design elements
- **Input Validation**: Ensures robust user input handling
- **Error Handling**: Graceful handling of storage and input errors

## 📝 Assignment Information

- **Submitted to**: Sobhan
- **Submitted by**: Affan
- **Date**: 03 August 2025
- **Project Type**: Flutter Mobile Application Development

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the excellent framework
- Material Design team for the design guidelines
- The open-source community for shared_preferences package

---

**Note**: This app is designed for spiritual practice and meditation support. May your practice bring peace and mindfulness to your daily life. 🙏
