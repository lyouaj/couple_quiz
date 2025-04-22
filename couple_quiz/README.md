# Couple Quiz App

A Flutter application that tests how well couples know each other.

## Features

- **International Support**: English, French, and Arabic (with RTL support)
- **Partner Quiz**: Both partners answer the same questions and then see how well they match
- **Beautiful UI**: Clean, modern user interface with a focus on usability
- **Scoring System**: Calculate and display matching percentage

## Getting Started

1. Clone this repository
2. Make sure you have Flutter installed and set up on your device
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## App Flow

1. **Welcome Screen**: Choose your preferred language (English, French, or Arabic)
2. **Home Screen**: Start the quiz or change the language
3. **Partner A Questions**: First partner answers 5 random questions
4. **Partner B Questions**: Second partner answers the same questions
5. **Results Screen**: See the matching score and comparison of answers
6. **Play Again**: Reset and start a new round with new questions

## Technical Details

- **State Management**: Provider pattern
- **Localization**: Flutter's built-in i18n with custom AppLocalizations
- **Question Randomization**: 5 questions randomly selected from a pool of questions
- **RTL Support**: Automatic text direction handling for Arabic
- **Theming**: Custom theme with consistent styling throughout the app

## Requirements

- Flutter 2.0 or higher
- Dart 2.12 or higher

## Dependencies

- provider: ^6.0.5
- shared_preferences: ^2.2.0
- intl: ^0.18.0
- flutter_localizations (from Flutter SDK) 