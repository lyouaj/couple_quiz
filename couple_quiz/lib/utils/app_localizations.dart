import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Couple Quiz',
      'startQuiz': 'Start Quiz',
      'changeLanguage': 'Change Language',
      'english': 'English',
      'french': 'Français',
      'arabic': 'العربية',
      'partnerA': 'Partner A',
      'partnerB': 'Partner B',
      'next': 'Next',
      'done': 'Done',
      'score': 'Score',
      'playAgain': 'Play Again',
      'questionProgress': 'Question %d/5',
      'matchedScore': 'You matched %d%!',
    },
    'fr': {
      'appTitle': 'Quiz de Couple',
      'startQuiz': 'Commencer le Quiz',
      'changeLanguage': 'Changer de Langue',
      'english': 'English',
      'french': 'Français',
      'arabic': 'العربية',
      'partnerA': 'Partenaire A',
      'partnerB': 'Partenaire B',
      'next': 'Suivant',
      'done': 'Terminé',
      'score': 'Score',
      'playAgain': 'Rejouer',
      'questionProgress': 'Question %d/5',
      'matchedScore': 'Vous avez %d% de correspondance !',
    },
    'ar': {
      'appTitle': 'اختبار الزوجين',
      'startQuiz': 'ابدأ الاختبار',
      'changeLanguage': 'تغيير اللغة',
      'english': 'English',
      'french': 'Français',
      'arabic': 'العربية',
      'partnerA': 'الشريك أ',
      'partnerB': 'الشريك ب',
      'next': 'التالي',
      'done': 'تم',
      'score': 'النتيجة',
      'playAgain': 'العب مرة أخرى',
      'questionProgress': 'السؤال %d/5',
      'matchedScore': 'تطابقت إجاباتكما بنسبة %d٪!',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]?['appTitle'] ?? _localizedValues['en']!['appTitle']!;
  String get startQuiz => _localizedValues[locale.languageCode]?['startQuiz'] ?? _localizedValues['en']!['startQuiz']!;
  String get changeLanguage => _localizedValues[locale.languageCode]?['changeLanguage'] ?? _localizedValues['en']!['changeLanguage']!;
  String get english => _localizedValues[locale.languageCode]?['english'] ?? _localizedValues['en']!['english']!;
  String get french => _localizedValues[locale.languageCode]?['french'] ?? _localizedValues['en']!['french']!;
  String get arabic => _localizedValues[locale.languageCode]?['arabic'] ?? _localizedValues['en']!['arabic']!;
  String get partnerA => _localizedValues[locale.languageCode]?['partnerA'] ?? _localizedValues['en']!['partnerA']!;
  String get partnerB => _localizedValues[locale.languageCode]?['partnerB'] ?? _localizedValues['en']!['partnerB']!;
  String get next => _localizedValues[locale.languageCode]?['next'] ?? _localizedValues['en']!['next']!;
  String get done => _localizedValues[locale.languageCode]?['done'] ?? _localizedValues['en']!['done']!;
  String get score => _localizedValues[locale.languageCode]?['score'] ?? _localizedValues['en']!['score']!;
  String get playAgain => _localizedValues[locale.languageCode]?['playAgain'] ?? _localizedValues['en']!['playAgain']!;
  
  String questionProgress(int current) {
    final String template = _localizedValues[locale.languageCode]?['questionProgress'] ?? _localizedValues['en']!['questionProgress']!;
    return template.replaceAll('%d', current.toString());
  }
  
  String matchedScore(int percentage) {
    final String template = _localizedValues[locale.languageCode]?['matchedScore'] ?? _localizedValues['en']!['matchedScore']!;
    return template.replaceAll('%d', percentage.toString());
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
} 