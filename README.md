# 🗺️ KhojBin – CityCleaner App

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

KhojBin is a **map-based civic utility mobile application** built with **Flutter**, empowering citizens to **locate nearby public dustbins**, **report issues**, and **contribute to a cleaner city**. Developed following a **Figma-first UI approach** for clean, usable, and scalable design.

## 🚀 Project Objective

KhojBin aims to:
- Enable users to find nearby dustbins via an interactive live map
- Facilitate reporting of dustbin-related issues by citizens
- Promote public participation in city cleanliness initiatives
- Deliver a scalable civic-tech solution for urban environments

## 🎨 Design Reference (Figma)

- UI/UX crafted in **Figma** with a focus on intuitive design
- Flutter implementation mirrors the Figma design closely
- Consistent design system for bottom sheets, spacing, typography, and layouts

> **Design Workflow:**  
> Figma Design → UI Breakdown → Reusable Widgets → Flutter Implementation

## 🧱 Tech Stack

| Technology       | Purpose                          |
|------------------|----------------------------------|
| Flutter          | Cross-platform mobile framework  |
| Dart             | Programming language             |
| flutter_map      | Interactive map rendering        |
| OpenStreetMap    | Free map tiles                   |
| Geolocator       | User location services           |
| Android Emulator | Development and testing          |
| Figma            | UI/UX design tool                |
| Git & GitHub     | Version control and collaboration|

## 📁 Project Structure

```
lib/
├── core/
│   ├── theme/
│   │   └── app_color.dart
│   └── widgets/
│       └── app_header.dart
├── features/
│   ├── map/
│   │   ├── map_screen.dart
│   │   ├── map_controls.dart
│   │   └── map_markers.dart
│   ├── bottom_sheets/
│   │   ├── bin_info_sheet.dart
│   │   ├── share_sheet.dart
│   │   └── report_sheet.dart
│   └── sheets/
│       └── add_bin_sheet.dart
└── main.dart
```

## ✅ Features Implemented

### 🗺️ Map & UI
- Seamless integration with OpenStreetMap using `flutter_map`
- Custom markers for dustbin locations
- Optimized map rendering for smooth performance

### 📍 Marker Interaction
- Interactive dustbin markers that trigger bottom sheets on tap
- Displays distance from user location
- Estimated travel time (walking, biking, driving)
- Navigation UI ready for integration

### 📦 Bottom Sheets
- **Bin Info Sheet**: Core interaction for bin details
- **Share Sheet**: Share bin locations
- **Report Sheet**: Report maintenance issues
- **Add Bin Sheet**: Basic form for adding new bins

### 🧩 UI Components
- Branded custom header
- Floating action button for quick actions
- Side-mounted map controls
- Modular and reusable widget architecture

### 🛠️ Project Stability
- Resolved Android build configurations
- Cleaned up duplicate resources
- Standardized folder structure
- Fixed imports and widget dependencies

## ⚠️ Known Warnings (Non-Critical)

- Emulator performance logs (e.g., skipped frames)
- OpenGL/EGL rendering messages
- Impeller-related logs

> These are **emulator-specific warnings** and do not affect app functionality on physical devices.

## 🧭 Upcoming Features

- 🧭 Turn-by-turn directions with route visualization and ETA
- 📸 Photo upload for adding new bins
- 🎉 Success feedback screen ("You are a City Hero!")
- 📍 Proximity-based bin filtering
- 🔐 User authentication (optional)
- ⚡ Performance enhancements and optimizations

## 🏁 Getting Started

### Prerequisites
- Flutter SDK installed ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Android Studio or Xcode for emulators/simulators

### Running the App
```bash
# Clean previous builds
flutter clean

# Install dependencies
flutter pub get

# Run on connected device or emulator
flutter run
```

## 👨‍💻 Author

**Prateek Kumar**  
Flutter Developer (Internship Project)  
📍 India  

## 📜 License

This project is developed for educational and internship purposes.  
Feel free to fork, experiment, and contribute!
