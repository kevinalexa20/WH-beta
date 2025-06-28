# WarungHemat Mobile App

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Appwrite](https://img.shields.io/badge/Appwrite-FD366E?style=for-the-badge&logo=appwrite&logoColor=white)](https://appwrite.io)

A hyperlocal mobile application connecting UMKM (Micro, Small & Medium Enterprises) food vendors with surplus products to local consumers seeking affordable food options, helping reduce food waste while supporting local businesses.

## 🎯 Project Overview

**WarungHemat** addresses two critical socio-economic challenges in Indonesia:

- **Food Waste**: Indonesia wastes 23-48 million tons of food annually, causing economic losses of Rp 213-551 trillion per year
- **UMKM Financial Vulnerability**: Small food vendors often face losses due to unsold products and perishable ingredients

### Key Features

#### For Consumers

- 📍 **Location-based Discovery**: Find nearby food deals automatically
- 🍔 **Food Item Details**: View detailed information about available food
- 🏪 **Vendor Profiles**: See vendor information and location
- 📞 **Direct Contact**: Connect with vendors via phone

#### For Merchants

- 🏪 **Vendor Profile Management**: Create and manage shop profiles
- 🍕 **Food Item Management**: Upload and manage food listings
- 📊 **Inventory Control**: Update item availability status
- 💰 **Revenue Recovery**: Monetize surplus food items

## 🛠️ Tech Stack

### Frontend

- **Flutter** - Cross-platform mobile development
- **Riverpod** - State management and dependency injection
- **Go Router** - Navigation and routing
- **Material 3** - Modern UI design system

### Backend

- **Appwrite** - Backend-as-a-Service (BaaS)
  - Authentication
  - Database
  - File Storage

### Key Packages

```yaml
# State Management
flutter_riverpod: ^3.0.0-dev.15
riverpod_annotation: ^3.0.0-dev.15

# UI & UX
flutter_screenutil: ^5.9.3
google_fonts: ^6.2.1
cached_network_image: ^3.4.1
smooth_page_indicator: ^1.2.1

# Location & Maps
geolocator: ^14.0.1
geocoding: ^4.0.0
permission_handler: ^12.0.0+1

# Networking & Data
dio: ^5.8.0+1
appwrite: ^17.0.1

# Utilities
shared_preferences: ^2.5.3
image_picker: ^1.1.2
url_launcher: ^6.3.1
flutter_dotenv: ^5.2.1
form_validator: ^2.1.1
```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
└── src/
    ├── app.dart             # Main app configuration
    ├── common/              # Shared components
    │   ├── models/          # Data models
    │   ├── widgets/         # Reusable UI components
    │   └── constants/       # App constants
    ├── features/            # Feature-based modules
    │   ├── authentication/ # Login/Register
    │   ├── home/           # Main dashboard
    │   ├── merchant/       # Vendor features
    │   ├── onboarding/     # App introduction
    │   ├── order/          # Order management
    │   ├── profile/        # User profiles
    │   └── startup/        # App initialization
    ├── routes/             # Navigation configuration
    └── utils/              # Utilities and helpers
        └── appwrite_client.dart
```

## 🗄️ Database Schema

### Collections Overview

#### 1. `users`

Primary collection for all registered users (consumers & merchants)

```
- name: String (128 bytes)
- email: Email (255 bytes)
- role: Enum [customer, merchant]
- phoneNumber: Phone (optional)
```

#### 2. `profiles`

Merchant-specific information (created only for vendors)

```
- userId: String (255 bytes) - Links to users collection
- merchantName: String
- address: String
- latitude: Float
- longitude: Float
- description: String (optional)
```

#### 3. `food_items`

Food listings from merchants

```
- merchantId: String - Links to profiles
- name: String
- description: String
- price: Integer
- quantity: Integer
- imageUrl: String (optional)
- status: Enum [available, sold_out]
- createdAt: DateTime
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code
- Appwrite instance

### Installation

1. **Clone the repository**

```bash
git clone <repository-url>
cd wh_mobile
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Environment Setup**
   Create a `.env` file in the root directory:

```env
APPWRITE_ENDPOINT=https://your-appwrite-endpoint
APPWRITE_PROJECT_ID=your-project-id
APPWRITE_DATABASE_ID=your-database-id
```

4. **Generate code**

```bash
dart run build_runner build
```

5. **Run the app**

```bash
flutter run
```

## 🎨 Design System

### Color Palette

- **Primary (Green)**: Trust, freshness, and growth
- **Secondary (Yellow)**: Optimism, friendliness, and call-to-action
- **Tertiary (Brown)**: Authentic, warm, earthy feel
- **Neutral (Cream & Dark Gray)**: Maximum readability and eye comfort

### Typography

- **Google Fonts** integration for consistent typography
- **Material 3** design guidelines compliance

## 🔧 Development

### Code Generation

```bash
# Generate Riverpod providers and JSON serialization
dart run build_runner build --delete-conflicting-outputs

# Watch for changes during development
dart run build_runner watch
```

### Linting

```bash
flutter analyze
dart run custom_lint
```

### Testing

```bash
flutter test
```

## 📱 User Flow

### Consumer Journey

1. **Discovery**: Open app → automatic location-based food discovery
2. **Browse**: View nearby food items in grid layout
3. **Details**: Tap item → see full details and vendor info
4. **Contact**: Direct phone call to vendor for purchase

### Merchant Journey

1. **Setup**: Register → create vendor profile
2. **List**: Add food items with photos and details
3. **Manage**: Update availability and inventory
4. **Connect**: Receive calls from interested customers

## 🌍 Impact Goals

- **Reduce Food Waste**: Help vendors monetize surplus food
- **Support UMKM**: Provide additional revenue streams for small businesses
- **Consumer Benefits**: Affordable food options for price-conscious consumers
- **Community Building**: Strengthen local food ecosystems

## 📈 MVP Features (Phase 1)

- [x] User authentication (consumers & merchants)
- [x] Vendor profile management
- [x] Food item CRUD operations
- [x] Location-based food discovery
- [x] Item detail views
- [x] Direct vendor contact via phone

## 🔮 Future Enhancements

- [ ] In-app messaging system
- [ ] Order management and payment integration
- [ ] Rating and review system
- [ ] Push notifications
- [ ] Advanced search and filters
- [ ] Analytics dashboard for merchants

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

Developed as a capstone project for IBM Mini-Hackathon, demonstrating the feasibility and positive impact potential of a well-designed technology solution.

## 📞 Support

For support and questions, please [open an issue](../../issues)

---

**WarungHemat** - _Connecting Communities, Reducing Waste, Supporting Local Business_
