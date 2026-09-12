# 📱 BMI Calculator - Flutter Clean Architecture

A professional, high-performance Body Mass Index (BMI) calculator built with **Flutter**. This project demonstrates the implementation of **Clean Architecture** principles and reactive state management using the **BLoC/Cubit** pattern.

Developed as part of the **NTI (National Telecommunication Institute)** mobile development program.

---

## 🚀 Features

- **Precise BMI Calculation**: Real-time calculation via integration with the APIVerve BMI API.
- **Dynamic UI**: Responsive design that adapts to user input.
- **State Management**: Robust state handling (Loading, Success, Error) using Cubit.
- **Clean Architecture**: Decoupled layers (Data, Presentation, Core) for maximum maintainability.
- **Reusable Components**: Custom-built UI widgets for text fields, buttons, and gender selection.
- **Detailed Results**: Provides BMI scores, categories, age calculation, and health summaries.

---

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Data Modeling**: [Equatable](https://pub.dev/packages/equatable) for value comparison.

---

## 🏗 Architecture Overview

The project follows a feature-driven **Clean Architecture** structure:

```text
lib/
├── core/                  # Global constants, errors, and shared logic
│   └── constants/         # API endpoints and keys
├── features/
│   └── bmi/
│       ├── data/          # Models and Data Sources
│       │   └── models/    # JSON serialization (BmiResponse)
│       └── presentation/  # UI Layer
│           ├── cubit/     # Controller & States (BmiCubit)
│           ├── screens/   # Main App Screens
│           └── widgets/   # Reusable UI Components
└── main.dart              # App Entry Point
```

---

## ⚙️ Getting Started

### Prerequisites
- Flutter SDK installed.
- An API Key from [APIVerve](https://apiverve.com/).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/bmi_nti_aug.git
   ```
2. Navigate to the project directory:
   ```bash
   cd bmi_nti_aug
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure your API key in `lib/core/constants/api_constants.dart`.
5. Run the app:
   ```bash
   flutter run
   ```

---

## 🎓 Author
      A'laa Omar Hamed .
