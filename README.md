# Livo - Social Media App

A modern social media application built with Flutter and Supabase, featuring real-time feeds, stories, messaging, and comprehensive user profiles.

## 🚀 Features Implemented

### ✅ Core Architecture & Authentication System (Task 1)

- **Flutter Project Structure**: Feature-based modular architecture with clean separation of concerns
- **Dependencies**: All required packages configured (Riverpod, GoRouter, Supabase, Lottie, etc.)
- **Design System**: Complete theming system with consistent typography and colors
- **Supabase Integration**: Full authentication, database, and storage integration
- **Authentication Screens**:
  - Splash screen with animations
  - Onboarding with multi-step introduction
  - Login with email/password and Google OAuth
  - Sign up with comprehensive validation
  - Password reset functionality
- **State Management**: Riverpod providers for authentication and session management
- **Lottie Animations**: Integrated animations for splash, onboarding, and loading states
- **Database Schema**: Complete PostgreSQL schema with RLS policies
- **Storage Configuration**: Secure file upload with proper bucket policies

### 📱 User Interface

- **Modern Design**: Material Design 3 with custom theming
- **Responsive Layout**: Optimized for various screen sizes
- **Smooth Animations**: Page transitions and micro-interactions
- **Accessibility**: Semantic widgets and proper contrast ratios

### 🔐 Security

- **Row Level Security**: Comprehensive RLS policies for data protection
- **Authentication**: Email/password and OAuth (Google) support
- **Input Validation**: Client-side and server-side validation
- **Secure Storage**: Proper access controls for media files

### 🗄️ Database

- **Schema**: Optimized PostgreSQL schema with proper relationships
- **Performance**: Indexed queries and optimized joins
- **Real-time**: Supabase Realtime subscriptions
- **Triggers**: Automatic count updates and notifications

## 📋 Project Structure

```
lib/
├── src/
│   ├── core/                    # Core application logic
│   │   ├── constants/          # App constants
│   │   ├── config/             # Configuration files
│   │   ├── errors/             # Custom exceptions
│   │   ├── theme/              # Design system
│   │   └── router/             # Navigation
│   ├── features/               # Feature modules
│   │   ├── auth/               # Authentication
│   │   ├── feed/               # Social feed
│   │   ├── profile/            # User profiles
│   │   ├── search/             # Search functionality
│   │   ├── chat/               # Messaging
│   │   └── notifications/      # Push notifications
│   ├── services/               # Business logic
│   │   ├── supabase_service.dart
│   │   └── auth_service.dart
│   └── shared/                 # Shared components
│       ├── widgets/            # Reusable widgets
│       └── providers/          # Riverpod providers
├── main.dart                   # App entry point
└── assets/                     # App assets
    ├── animations/
    └── images/
```

## 🛠️ Setup Instructions

### Prerequisites

- Flutter SDK (>=3.9.2)
- Dart SDK
- Supabase account
- Git

### 1. Clone the Repository

```bash
git clone <repository-url>
cd livo-dev
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Supabase

1. Create a new project at [supabase.com](https://supabase.com)
2. Run the database setup script from `database/setup_database.sql`
3. Copy your Supabase URL and anon key
4. Update configuration in `lib/src/core/config/supabase_config.dart`:

```dart
static const String _prodUrl = 'YOUR_SUPABASE_URL';
static const String _prodAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### 4. Enable Authentication Providers

In your Supabase project:

1. Go to Authentication > Providers
2. Enable Google OAuth
3. Configure redirect URLs

### 5. Create Storage Buckets

The setup script creates these automatically:
- `profiles` - User avatars
- `posts` - Post media
- `stories` - Story media
- `messages` - Message media

### 6. Run the App

```bash
flutter run
```

## 📊 Database Schema

### Core Tables

- **profiles** - User profiles and metadata
- **posts** - Social posts with media
- **stories** - Ephemeral stories (24h expiry)
- **likes** - Post likes
- **comments** - Post comments
- **follows** - User relationships
- **messages** - Private messaging
- **notifications** - In-app notifications

### Security

- Row Level Security (RLS) on all tables
- Proper foreign key constraints
- Input validation and sanitization
- Secure storage policies

## 🎨 Design System

### Colors

- **Primary**: Pink (#E91E63)
- **Secondary**: Blue (#2196F3)
- **Background**: Light gray (#FAFAFA)
- **Text**: Dark gray (#212121)

### Typography

- **Display**: Bold, large headers
- **Headline**: Medium-sized section headers
- **Body**: Regular content text
- **Caption**: Small metadata text

### Components

- **Buttons**: Elevated, outlined, text variants
- **Forms**: Consistent input fields with validation
- **Cards**: Rounded corners with shadows
- **Navigation**: Bottom tab navigation

## 🔧 Development

### Code Generation

```bash
# Run build runner for generated files
flutter pub run build_runner build
```

### Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Build

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# iOS build
flutter build ios --release
```

## 📱 Features Overview

### Authentication
- [x] Email/password authentication
- [x] Google OAuth
- [x] Password reset
- [x] Session management
- [x] Onboarding flow

### Social Features
- [x] User profiles
- [ ] Post creation (planned)
- [ ] Feed system (planned)
- [ ] Like/comment system (planned)
- [ ] Follow/unfollow (planned)
- [ ] Stories (planned)
- [ ] Direct messaging (planned)

### Technical Features
- [x] Real-time updates
- [x] Image/video upload
- [ ] Push notifications (planned)
- [ ] Offline support (planned)
- [ ] Dark mode (planned)

## 🔒 Security Considerations

- All API requests use HTTPS
- User input is validated and sanitized
- RLS policies prevent unauthorized data access
- File uploads are restricted by type and size
- Session tokens are securely stored

## 🚀 Deployment

### Android

1. Update `android/app/build.gradle` with your app details
2. Generate signing key:
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
3. Configure signing in `android/key.properties`
4. Build release APK or AAB

### iOS

1. Configure Xcode project settings
2. Update bundle identifier
3. Configure signing certificates
4. Build and upload to App Store

### Web

```bash
flutter build web
```

## 📝 Next Steps

### Phase 2 (Planned)
- Complete feed implementation
- Post creation with media upload
- User interaction features (likes, comments)
- Search and discovery
- Stories functionality

### Phase 3 (Planned)
- Direct messaging
- Push notifications
- Video posts
- Live streaming
- Monetization features

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support, please:

1. Check the [database documentation](database/README.md)
2. Review the [Supabase documentation](https://supabase.com/docs)
3. Create an issue in the repository

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - Cross-platform UI framework
- [Supabase](https://supabase.com) - Backend as a Service
- [Riverpod](https://riverpod.dev) - State management
- [GoRouter](https://pub.dev/packages/go_router) - Navigation
- [Lottie](https://lottiefiles.com/) - Animations

---

**Built with ❤️ using Flutter and Supabase**