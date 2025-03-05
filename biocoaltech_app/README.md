# BioCoalTech India Mobile App

A Flutter application for BioCoalTech India that helps manage agricultural waste conversion to biocoal, providing real-time monitoring and marketplace features.

## Features

- **Dashboard**: Comprehensive overview of production metrics and key performance indicators
- **Process Monitoring**: Real-time IoT data visualization and alerts
- **Marketplace**: Platform for buying and selling biocoal products
- **Material Design 3**: Modern UI with dynamic color schemes
- **Responsive Layout**: Adapts to different screen sizes

## Project Structure

```
biocoaltech_app/
├── lib/
│   ├── main.dart              # App entry point and theme configuration
│   ├── screens/               # Application screens
│   │   ├── dashboard_screen.dart
│   │   ├── monitoring_screen.dart
│   │   └── marketplace_screen.dart
│   └── services/              # Utility services
│       └── navigation_service.dart
├── assets/                    # App assets (images, fonts)
└── pubspec.yaml              # Project configuration and dependencies
```

## Dependencies

- `flutter_sdk`: >=3.0.0 <4.0.0
- `http`: ^1.1.0 - For API calls
- `shared_preferences`: ^2.2.0 - For local storage
- `provider`: ^6.0.5 - For state management
- `fl_chart`: ^0.63.0 - For data visualization
- `google_maps_flutter`: ^2.3.0 - For location services
- `intl`: ^0.18.1 - For internationalization

## Setup Instructions

1. **Install Flutter**
   - Follow the official Flutter installation guide: https://flutter.dev/docs/get-started/install

2. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/biocoaltech-app.git
   cd biocoaltech-app
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

## Development Guidelines

- Follow Material Design 3 guidelines for UI components
- Use the provided color scheme and typography
- Implement error handling for all API calls
- Write meaningful commit messages
- Document new features and changes

## Features to be Implemented

- [ ] User authentication and profile management
- [ ] Real-time IoT data integration
- [ ] Push notifications for alerts
- [ ] Offline support
- [ ] Analytics dashboard
- [ ] Multi-language support

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is proprietary software owned by BioCoalTech India.

## Contact

BioCoalTech India - info@biocoaltech.in
