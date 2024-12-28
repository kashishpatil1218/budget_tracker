# Expense Manager Application

An **Expense Manager Application** built using **Flutter**, designed to help users track and manage their expenses effectively. This app is suitable for personal finance management, offering features like adding, categorizing, and visualizing expenses.

## Features

- **Add Expenses**: Record daily expenses with details such as amount, category, and description.
- **Categorization**: Categorize expenses (e.g., Food, Travel, Bills, Shopping).
- **Analytics**: Visualize your spending trends using graphs and charts.
- **Search & Filter**: Easily find expenses by date, category, or amount.
- **Dark Mode**: User-friendly interface with light and dark themes.
- **Data Persistence**: Save expense data locally or sync with cloud storage (if implemented).

## Technologies Used

- **Flutter**: Frontend framework for building the app.
- **Dart**: Programming language for app logic.
- **SQLite**: Local database for storing expense records.
- **Provider**: State management for the app.

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/expense-manager.git
   cd expense-manager
   ```

2. **Install Dependencies**
   Ensure you have Flutter installed. Run the following command to install dependencies:
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   Connect a device or emulator and run:
   ```bash
   flutter run
   ```



## Directory Structure

```
expense-manager/
├── lib/
│   ├── main.dart          # Entry point
│   ├── screens/           # UI screens
│   ├── models/            # Data models
│   ├── providers/         # State management
│   ├── widgets/           # Reusable widgets
│   └── utils/             # Helper functions and constants
├── assets/                # Images and fonts
├── pubspec.yaml           # Dependencies
└── README.md              # Project documentation
```

