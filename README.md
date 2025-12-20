# 🗺️ CityCleaner – Civic Cleanliness & Navigation App

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![OpenStreetMap](https://img.shields.io/badge/OpenStreetMap-7EBC6F?style=for-the-badge&logo=openstreetmap&logoColor=white)](https://www.openstreetmap.org/)

CityCleaner is a **map-based civic utility mobile application** built using **Flutter**, designed to help citizens **locate nearby public dustbins**, **navigate to them**, **report issues**, and actively **participate in keeping cities clean**.

The app follows a **Figma-first development approach** and focuses on **real-world map interactions, routing logic, and scalable architecture**.

---

## 🚀 Project Objective

CityCleaner aims to:
- Help users discover nearby public dustbins using an interactive map
- Provide **distance, ETA, and route visualization** to selected locations
- Enable citizens to report dustbin-related issues
- Lay a strong foundation for a scalable civic-tech platform

---

## 🎨 Design Reference (Figma)

- UI/UX designed in **Figma**
- Flutter implementation closely matches Figma layouts
- Bottom sheets, spacing, typography, and interaction patterns are design-driven

> **Workflow:**  
> Figma → UI Breakdown → Modular Widgets → Flutter Implementation

---

## 🧱 Tech Stack

| Technology | Purpose |
|-----------|--------|
| Flutter | Cross-platform mobile app |
| Dart | Application logic |
| flutter_map | Interactive map rendering |
| OpenStreetMap | Map tiles |
| Geolocator | User location & distance |
| Custom utils | Distance & ETA calculation |
| Git & GitHub | Version control & collaboration |
| Figma | UI/UX design |

---

## 📁 Project Structure

lib/
├── core/
│ ├── theme/
│ │ └── app_color.dart
│ └── widgets/
│ └── app_header.dart
│
├── features/
│ ├── map/
│ │ ├── map_screen.dart
│ │ ├── map_controls.dart
│ │ └── map_markers.dart
│ │
│ ├── bottom_sheets/
│ │ ├── bin_info_sheet.dart
│ │ ├── share_sheet.dart
│ │ └── report_sheet.dart
│ │
│ └── sheets/
│ └── add_bin_sheet.dart
│
└── main.dart

---

## ✅ Features Implemented (Verified)

### 🗺️ Map & Location
- OpenStreetMap integration using `flutter_map`
- User current location detection
- Static dustbin markers
- Smooth map interactions with zoom & controls

### 📍 Marker Interaction & Navigation
- Tap on dustbin marker opens a detailed bottom sheet
- Displays:
  - Distance from current location
  - Estimated travel time (Walk / Bike / Car)
- **Route visualization using polylines**
- Map auto-adjusts bounds to fit route

### 🧭 Directions & ETA (Phase 5 Complete)
- Straight-line routing logic
- Custom ETA calculation based on transport mode
- Walk, Bike, and Car modes supported
- No external Directions API dependency
- Offline-friendly logic

### 📦 Bottom Sheets
- **Bin Info Sheet** – core interaction
- **Report Sheet** – predefined reporting options
- **Share Sheet** – UI for sharing location
- **Add Bin Sheet** – basic form for new bins

### 🧩 UI & Architecture
- Custom branded app header (CityCleaner)
- Floating action button for adding bins
- Right-side map controls
- Feature-based, scalable folder structure
- Stateful map handling with mounted-safe async logic

### 🛠️ Project Stability
- Android build issues resolved
- Resource duplication cleaned
- Folder structure standardized
- Git branching & commits follow best practices

---

## ⚠️ Known Notes

- Emulator may show frame-skip or OpenGL logs
- These are **emulator performance warnings**, not app errors
- App performs smoothly on real devices

---

## 🧭 Upcoming Work (Planned)

- 📸 Add bin with photo upload
- 🎉 Success feedback screen ("You are a City Hero")
- 📍 Radius-based bin filtering UI polish
- 🔐 Authentication (after backend integration)
- 🌐 Backend APIs for real bin data
- 📦 App icons, splash screen, and release builds

---

## 🏁 Getting Started

### Prerequisites
- Flutter SDK installed
- Android Studio / Xcode for emulators

### Run Locally
```bash
flutter clean
flutter pub get
flutter run
```

## 👨‍💻 Author

Prateek Kumar  
Flutter Developer  
📍 India  

## 📜 License

This project is built for learning, internship, and portfolio purposes.  
Contributions and experimentation are welcome.

---

## ✅ WHAT CHANGED vs OLD README (Quick Summary)

✔ Added **Directions & Route Visualization**  
✔ Added **ETA logic explanation**  
✔ Removed claims that were still "upcoming"  
✔ Updated branding to **CityCleaner** consistently  
✔ Reflected **Phase 5 completion honestly**  
✔ Made README more **portfolio & recruiter friendly**
