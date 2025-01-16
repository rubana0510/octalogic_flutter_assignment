# Vehicle Registration App

A Flutter-based mobile application for vehicle registration and booking management.

## Overview

This application allows users to register vehicles and manage bookings through an intuitive interface. It features local data persistence, API integration, and a comprehensive booking system with date validation.

## Features

- **User Registration**: Capture user details including first and last name
- **Vehicle Management**:
    - Select number of wheels
    - Choose vehicle types based on wheel configuration
    - View detailed vehicle information
- **Booking System**:
    - Interactive calendar for date selection
    - Date range validation (3-10 days)
    - Automatic blocking of unavailable dates
    - Real-time booking confirmation
- **Data Management**:
    - Local data persistence using SQLite
    - API integration for vehicle data
    - State management using Provider

## Tech Stack

- **Frontend**: Flutter SDK
- **State Management**: Provider
- **Database**: SQLite with Drift
- **Networking**: Dio HTTP client
- **UI Components**: flutter_date_range_picker

## Prerequisites

- Flutter SDK (stable channel)
- Android Studio or VS Code with Flutter and Dart plugins
- Android/iOS emulator or physical device

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/rubana0510/octalogic_flutter_assignment.git
   cd vehicle-registration-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

## Application Flow

### 1. Initial Screen
- User input for first and last name
- Data validation before proceeding

### 2. Wheel Selection Screen
- Radio button selection for number of wheels
- Dynamic options fetched from API

### 3. Vehicle Type Selection
- Displays available vehicles based on wheel configuration
- Integration with vehicle types API
- Filtered mapping between wheels and vehicle types

### 4. Vehicle Details Screen
- Comprehensive vehicle information display
- Dynamic image loading
- Integration with vehicle details API

### 5. Booking Screen
- Interactive calendar interface
- Date range selection (3-10 days)
- Automatic date validation
- Integration with booking availability API
- Confirmation dialog with booking summary

## Project Structure

```
lib/
├── data/
│   ├── daos/           # Database Access Objects
│   ├── db/             # Database configuration
│   └── network/        # API integration
├── repository/         # Data management layer
├── routes/            # Navigation management
├── ui/
│   ├── vehicles/      # Screen implementations
│   └── widgets/       # Reusable components
└── values/            # Constants and themes
```

### Key Components

#### Data Layer
- **DAOs**: Handle database operations for bookings and user data
- **Database**: Custom tables and field definitions
- **Network**: API endpoints and error handling

#### Repository Layer
- **Base Repository**: Core data management functionality
- **Vehicle Repository**: Vehicle-specific data operations
- **Implementation**: Concrete implementation of repository interfaces

#### UI Layer
- **Screens**: Individual screen implementations
- **ChangeNotifier**: State management for UI updates
- **Widgets**: Reusable UI components

## Database Management

To generate database files:
```bash
dart run build_runner build
```

## State Management

The application uses Provider for state management with the following features:
- Centralized state control
- Reactive UI updates
- Efficient data propagation

## API Integration

The application integrates with several endpoints:
- Vehicle types API
- Vehicle details API
- Booking availability API
- Booking submission API

**APK Link**
https://drive.google.com/file/d/1IO-zc72jWxMmNdubtjjSoPrjbntZt24D/view?usp=sharing

**Video Recording Link**
https://drive.google.com/file/d/1Qnpyun1gzrX8_JDtdPAfv2w2gTo6m_tS/view?usp=sharing

