class Question {
  final String id;
  final Map<String, String> text; // {'en': 'Your color?', 'fr': 'Votre couleur?', 'ar': '...?'}
  final List<Map<String, String>> options; // Each option: {'en': 'Red', 'fr': 'Rouge', 'ar': '...'}

  Question({
    required this.id,
    required this.text,
    required this.options,
  });

  String getQuestionText(String languageCode) {
    return text[languageCode] ?? text['en'] ?? '';
  }

  List<String> getOptions(String languageCode) {
    return options.map((option) => option[languageCode] ?? option['en'] ?? '').toList();
  }
} 