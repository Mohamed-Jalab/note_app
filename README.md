# Notes App

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![CI](https://github.com/Mohamed-Jalab/note_app/actions/workflows/ci.yml/badge.svg)](https://github.com/Mohamed-Jalab/note_app/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A beginner-friendly, offline notes application built with Flutter. It
demonstrates forms, reusable widgets, Cubit state management, and local Hive
persistence without hiding the fundamentals behind a complex architecture.

## Features

- Create notes with validated title and content fields
- Edit a note by tapping its card or selecting **Edit**
- Delete notes safely through a confirmation dialog
- Store notes locally for offline use
- Display empty, loading, success, and error feedback
- Support Android, iOS, web, Windows, macOS, and Linux

## Screenshots

Screenshots are welcome. Add images to `docs/screenshots/`, then reference them
here in a future contribution.

## Built with

- [Flutter](https://flutter.dev) for the user interface
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [Hive](https://pub.dev/packages/hive) for local storage
- [intl](https://pub.dev/packages/intl) for date formatting

## Getting started

### Prerequisites

- Flutter SDK compatible with Dart `>=3.0.6 <4.0.0`
- A configured emulator, simulator, browser, or physical device

Check your installation with `flutter doctor`.

### Installation

```bash
git clone https://github.com/Mohamed-Jalab/note_app.git
cd note_app
flutter pub get
flutter run
```

## Project structure

```text
lib/
├── cubits/     # Application state and note operations
├── models/     # Hive data model and generated adapter
├── views/      # Full application screens
├── widgets/    # Small reusable UI components
└── main.dart   # Hive setup and application entry point
```

The add-note flow has its own `AddNoteCubit`. Reading, editing, and deleting
notes are managed by `NotesCubit`. This separation is small enough for a
beginner while still demonstrating clear responsibilities.

## Development

Format, analyze, and test before opening a pull request:

```bash
dart format .
flutter analyze
flutter test
```

After changing fields or annotations in `NoteModel`, regenerate the Hive
adapter:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Roadmap

- Search and filter notes
- Multiple note colors
- Pin and archive notes
- More unit and widget tests
- Import and export notes
- Accessibility and localization improvements

Ideas and beginner-friendly contributions are welcome. Read
[CONTRIBUTING.md](CONTRIBUTING.md) before starting.

## Community and support

- [Report a bug](https://github.com/Mohamed-Jalab/note_app/issues/new?template=bug_report.yml)
- [Suggest a feature](https://github.com/Mohamed-Jalab/note_app/issues/new?template=feature_request.yml)
- Read our [Code of Conduct](CODE_OF_CONDUCT.md)
- Report security concerns according to [SECURITY.md](SECURITY.md)

## License

This project is available under the [MIT License](LICENSE).
