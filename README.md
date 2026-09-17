# Flutter Marketplace Landing

A Flutter implementation of a marketplace landing screen using Clean Architecture with `flutter_bloc` state management.

## Features

- Responsive layout optimized for Flutter Web first, with mobile/tablet support.
- Coral/red landing theme with:
  - Top navigation and search
  - Hero section
  - Category chip navigation
  - Product card grid
  - Cookie & privacy dialog
  - Floating support and coupon actions
- Clean Architecture structure:
  - `data` layer (models, local datasource, repository implementation)
  - `domain` layer (entities, repository abstraction, use cases)
  - `presentation` layer (BLoC, pages, widgets)
- Marketplace BLoC handles:
  - loading / loaded / error states
  - category selection
  - search filtering
  - cookie consent/dismissal

## Project Structure

```text
lib/
├── core/
│   ├── constants/
│   ├── di/
│   └── theme/
└── features/
    └── marketplace/
        ├── data/
        ├── domain/
        └── presentation/
```

## Setup

1. Install Flutter (stable channel).
2. From repository root `/home/runner/work/flutter/flutter`, run:

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

## Placeholder Data & Branding

Replace placeholder content in:

- Product/category mock data:
  - `/home/runner/work/flutter/flutter/lib/features/marketplace/data/datasources/marketplace_local_datasource.dart`
- Brand and navigation text:
  - `/home/runner/work/flutter/flutter/lib/features/marketplace/presentation/widgets/marketplace_header.dart`
- Hero copy:
  - `/home/runner/work/flutter/flutter/lib/features/marketplace/presentation/widgets/hero_section.dart`

No third-party copyrighted logos are included.

## Notes for API Integration

To swap mock data with a real backend later:

1. Add a remote datasource in `data/datasources`.
2. Keep `MarketplaceRepository` contract unchanged in `domain/repositories`.
3. Update `MarketplaceRepositoryImpl` to use the remote datasource.
