import 'package:flutter/material.dart';
import 'dart:async';

// Language Support
enum Language {
  english('English', 'en'),
  french('Français', 'fr'),
  arabic('العربية', 'ar');
  
  final String displayName;
  final String code;
  const Language(this.displayName, this.code);
}

// Define translation map at the top of the file, outside any class
Map<String, Map<String, String>> translations = {
  'en': {
    'appTitle': 'Couple Quiz',
    'welcome': 'Welcome to Couple Quiz!',
    'tagline': 'Test how well you know each other',
    'startQuiz': 'Start Quiz',
    'playerSetup': 'Player Setup',
    'enterNames': 'Enter Player Names',
    'player1': 'Player 1',
    'player2': 'Player 2',
    'name': 'Name',
    'gender': 'Gender',
    'male': 'Male',
    'female': 'Female',
    'selectCategories': 'Select Categories',
    'selectQuestionCount': 'Select Number of Questions',
    'continueToQuiz': 'Continue to Quiz',
    'question': 'Question',
    'submitAnswer': 'Submit Answer',
    'timeLeft': 'Time left',
    'seconds': 'seconds',
    'quizResults': 'Quiz Results',
    'questionResults': 'Question Results',
    'startNewQuiz': 'Start New Quiz',
    'answered': 'answered',
    'match': 'Match! +10 points',
    'noMatch': 'No Match',
    'chooseLang': 'Choose Language',
    'score': 'Score',
    // Categories
    'preferences': 'Preferences',
    'relationship': 'Relationship',
    'memories': 'Memories',
    'future': 'Future Plans',
    'personal': 'Personal',
    // Questions
    'q_color': 'What is your partner\'s favorite color?',
    'q_food': 'What is your partner\'s favorite food?',
    'q_movie': 'What is your partner\'s favorite movie genre?',
    'q_music': 'What is your partner\'s favorite music genre?',
    'q_season': 'What is your partner\'s favorite season?',
    'q_notice': 'What did you first notice about your partner?',
    'q_happiest': 'What makes your partner happiest?',
    'q_love_language': 'What is your partner\'s love language?',
    'q_annoys': 'What annoys your partner the most?',
    'q_first_date': 'Where was your first date?',
    'q_first_met': 'What was your partner wearing when you first met?',
    'q_first_gift': 'What was your first gift to your partner?',
    'q_vacation': 'What is your partner\'s dream vacation destination?',
    'q_live': 'Where does your partner want to live in the future?',
    'q_children': 'How many children does your partner want?',
    'q_fear': 'What is your partner\'s biggest fear?',
    'q_dream': 'What is your partner\'s biggest dream or goal?',
    'q_relax': 'What does your partner do to relax?',
    // Answer options
    'blue': 'Blue',
    'red': 'Red',
    'green': 'Green',
    'purple': 'Purple',
    'black': 'Black',
    'pizza': 'Pizza',
    'pasta': 'Pasta',
    'burgers': 'Burgers', 
    'sushi': 'Sushi',
    'steak': 'Steak',
    'comedy': 'Comedy',
    'action': 'Action',
    'romance': 'Romance',
    'horror': 'Horror',
    'scifi': 'Sci-Fi',
    'pop': 'Pop',
    'rock': 'Rock',
    'hiphop': 'Hip Hop',
    'classical': 'Classical',
    'country': 'Country',
    'spring': 'Spring',
    'summer': 'Summer',
    'fall': 'Fall',
    'winter': 'Winter',
    'smile': 'Smile',
    'eyes': 'Eyes',
    'voice': 'Voice',
    'style': 'Style',
    'personality': 'Personality',
    'family_time': 'Family time',
    'achieve_goals': 'Achieving goals',
    'fun': 'Having fun',
    'quiet_time': 'Quiet time',
    'being_with_you': 'Being with you',
    'touch': 'Physical touch',
    'quality_time': 'Quality time',
    'words': 'Words of affirmation',
    'acts': 'Acts of service',
    'gifts': 'Gifts',
    'being_late': 'Being late',
    'messiness': 'Messiness',
    'rudeness': 'Rudeness',
    'loud_noises': 'Loud noises',
    'interruptions': 'Being interrupted',
    'restaurant': 'Restaurant',
    'movie_theater': 'Movie theater',
    'park': 'Park',
    'coffee_shop': 'Coffee shop',
    'beach': 'Beach',
    'blue_shirt': 'Blue shirt',
    'jeans': 'Jeans',
    'dress': 'Dress',
    'tshirt': 'T-shirt',
    'dont_remember': "Don't remember",
    'flowers': 'Flowers',
    'jewelry': 'Jewelry',
    'clothing': 'Clothing',
    'book': 'Book',
    'something_else': 'Something else',
    'europe': 'Europe',
    'caribbean': 'Caribbean',
    'asia': 'Asia',
    'africa': 'Africa',
    'south_america': 'South America',
    'big_city': 'Big city',
    'suburb': 'Suburb',
    'small_town': 'Small town',
    'rural': 'Rural area',
    'beach_town': 'Beach town',
    'none': 'None',
    'one': '1',
    'two': '2',
    'three': '3',
    'four_plus': '4 or more',
    'heights': 'Heights',
    'spiders': 'Spiders',
    'public_speaking': 'Public speaking',
    'failure': 'Failure',
    'being_alone': 'Being alone',
    'career': 'Career success',
    'travel': 'Travel the world',
    'start_family': 'Start a family',
    'finance': 'Financial freedom',
    'make_difference': 'Make a difference',
    'reading': 'Reading',
    'watching_tv': 'Watching TV',
    'exercise': 'Exercise',
    'music': 'Music',
    'sleep': 'Sleep',
  },
  'fr': {
    'appTitle': 'Quiz de Couple',
    'welcome': 'Bienvenue au Quiz de Couple !',
    'tagline': 'Testez combien vous vous connaissez',
    'startQuiz': 'Commencer le Quiz',
    'playerSetup': 'Configuration des Joueurs',
    'enterNames': 'Entrez les Noms des Joueurs',
    'player1': 'Joueur 1',
    'player2': 'Joueur 2',
    'name': 'Nom',
    'gender': 'Genre',
    'male': 'Homme',
    'female': 'Femme',
    'selectCategories': 'Sélectionnez les Catégories',
    'selectQuestionCount': 'Sélectionnez le Nombre de Questions',
    'continueToQuiz': 'Continuer au Quiz',
    'question': 'Question',
    'submitAnswer': 'Soumettre la Réponse',
    'timeLeft': 'Temps restant',
    'seconds': 'secondes',
    'quizResults': 'Résultats du Quiz',
    'questionResults': 'Résultats des Questions',
    'startNewQuiz': 'Commencer un Nouveau Quiz',
    'answered': 'a répondu',
    'match': 'Match ! +10 points',
    'noMatch': 'Pas de Match',
    'chooseLang': 'Choisissez la Langue',
    'score': 'Score',
    // Categories
    'preferences': 'Préférences',
    'relationship': 'Relation',
    'memories': 'Souvenirs',
    'future': 'Plans Futurs',
    'personal': 'Personnel',
    // Questions
    'q_color': 'Quelle est la couleur préférée de votre partenaire ?',
    'q_food': 'Quel est le plat préféré de votre partenaire ?',
    'q_movie': 'Quel est le genre de film préféré de votre partenaire ?',
    'q_music': 'Quel est le genre de musique préféré de votre partenaire ?',
    'q_season': 'Quelle est la saison préférée de votre partenaire ?',
    'q_notice': 'Qu\'avez-vous remarqué en premier chez votre partenaire ?',
    'q_happiest': 'Qu\'est-ce qui rend votre partenaire le plus heureux ?',
    'q_love_language': 'Quel est le langage d\'amour de votre partenaire ?',
    'q_annoys': 'Qu\'est-ce qui énerve le plus votre partenaire ?',
    'q_first_date': 'Où était votre premier rendez-vous ?',
    'q_first_met': 'Que portait votre partenaire quand vous vous êtes rencontrés ?',
    'q_first_gift': 'Quel a été votre premier cadeau à votre partenaire ?',
    'q_vacation': 'Quelle est la destination de vacances de rêve de votre partenaire ?',
    'q_live': 'Où votre partenaire souhaite-t-il vivre à l\'avenir ?',
    'q_children': 'Combien d\'enfants votre partenaire veut-il ?',
    'q_fear': 'Quelle est la plus grande peur de votre partenaire ?',
    'q_dream': 'Quel est le plus grand rêve ou objectif de votre partenaire ?',
    'q_relax': 'Que fait votre partenaire pour se détendre ?',
    // Answer options
    'blue': 'Bleu',
    'red': 'Rouge',
    'green': 'Vert',
    'purple': 'Violet',
    'black': 'Noir',
    'pizza': 'Pizza',
    'pasta': 'Pâtes',
    'burgers': 'Hamburgers', 
    'sushi': 'Sushi',
    'steak': 'Steak',
    'comedy': 'Comédie',
    'action': 'Action',
    'romance': 'Romance',
    'horror': 'Horreur',
    'scifi': 'Science-fiction',
    'pop': 'Pop',
    'rock': 'Rock',
    'hiphop': 'Hip Hop',
    'classical': 'Classique',
    'country': 'Country',
    'spring': 'Printemps',
    'summer': 'Été',
    'fall': 'Automne',
    'winter': 'Hiver',
    'smile': 'Sourire',
    'eyes': 'Yeux',
    'voice': 'Voix',
    'style': 'Style',
    'personality': 'Personnalité',
    'family_time': 'Temps en famille',
    'achieve_goals': 'Atteindre ses objectifs',
    'fun': 'S\'amuser',
    'quiet_time': 'Moments de calme',
    'being_with_you': 'Être avec vous',
    'touch': 'Contact physique',
    'quality_time': 'Temps de qualité',
    'words': 'Paroles d\'affirmation',
    'acts': 'Actes de service',
    'gifts': 'Cadeaux',
    'being_late': 'Être en retard',
    'messiness': 'Le désordre',
    'rudeness': 'L\'impolitesse',
    'loud_noises': 'Les bruits forts',
    'interruptions': 'Être interrompu',
    'restaurant': 'Restaurant',
    'movie_theater': 'Cinéma',
    'park': 'Parc',
    'coffee_shop': 'Café',
    'beach': 'Plage',
    'blue_shirt': 'Chemise bleue',
    'jeans': 'Jean',
    'dress': 'Robe',
    'tshirt': 'T-shirt',
    'dont_remember': 'Je ne m\'en souviens pas',
    'flowers': 'Fleurs',
    'jewelry': 'Bijoux',
    'clothing': 'Vêtements',
    'book': 'Livre',
    'something_else': 'Autre chose',
    'europe': 'Europe',
    'caribbean': 'Caraïbes',
    'asia': 'Asie',
    'africa': 'Afrique',
    'south_america': 'Amérique du Sud',
    'big_city': 'Grande ville',
    'suburb': 'Banlieue',
    'small_town': 'Petite ville',
    'rural': 'Zone rurale',
    'beach_town': 'Ville balnéaire',
    'none': 'Aucun',
    'one': '1',
    'two': '2',
    'three': '3',
    'four_plus': '4 ou plus',
    'heights': 'Les hauteurs',
    'spiders': 'Les araignées',
    'public_speaking': 'Parler en public',
    'failure': 'L\'échec',
    'being_alone': 'Être seul',
    'career': 'Réussite professionnelle',
    'travel': 'Voyager dans le monde',
    'start_family': 'Fonder une famille',
    'finance': 'Liberté financière',
    'make_difference': 'Faire une différence',
    'reading': 'Lecture',
    'watching_tv': 'Regarder la télé',
    'exercise': 'Exercice',
    'music': 'Musique',
    'sleep': 'Dormir',
  },
  'ar': {
    'appTitle': 'اختبار الزوجين',
    'welcome': 'مرحبًا بك في اختبار الزوجين!',
    'tagline': 'اختبر مدى معرفتكما ببعضكما البعض',
    'startQuiz': 'ابدأ الاختبار',
    'playerSetup': 'إعداد اللاعب',
    'enterNames': 'أدخل أسماء اللاعبين',
    'player1': 'اللاعب 1',
    'player2': 'اللاعب 2',
    'name': 'الاسم',
    'gender': 'الجنس',
    'male': 'ذكر',
    'female': 'أنثى',
    'selectCategories': 'حدد الفئات',
    'selectQuestionCount': 'حدد عدد الأسئلة',
    'continueToQuiz': 'متابعة إلى الاختبار',
    'question': 'سؤال',
    'submitAnswer': 'إرسال الإجابة',
    'timeLeft': 'الوقت المتبقي',
    'seconds': 'ثوان',
    'quizResults': 'نتائج الاختبار',
    'questionResults': 'نتائج الأسئلة',
    'startNewQuiz': 'بدء اختبار جديد',
    'answered': 'أجاب',
    'match': 'تطابق! +10 نقاط',
    'noMatch': 'عدم تطابق',
    'chooseLang': 'اختر اللغة',
    'score': 'النتيجة',
    // Categories
    'preferences': 'التفضيلات',
    'relationship': 'العلاقة',
    'memories': 'الذكريات',
    'future': 'الخطط المستقبلية',
    'personal': 'شخصي',
    // Questions
    'q_color': 'ما هو اللون المفضل لشريكك؟',
    'q_food': 'ما هو الطعام المفضل لشريكك؟',
    'q_movie': 'ما هو نوع الأفلام المفضل لشريكك؟',
    'q_music': 'ما هو نوع الموسيقى المفضل لشريكك؟',
    'q_season': 'ما هو الموسم المفضل لشريكك؟',
    'q_notice': 'ما الذي لاحظته أولاً في شريكك؟',
    'q_happiest': 'ما الذي يجعل شريكك أكثر سعادة؟',
    'q_love_language': 'ما هي لغة الحب لشريكك؟',
    'q_annoys': 'ما الذي يزعج شريكك أكثر؟',
    'q_first_date': 'أين كان موعدكما الأول؟',
    'q_first_met': 'ماذا كان يرتدي شريكك عندما التقيتما لأول مرة؟',
    'q_first_gift': 'ما كانت هديتك الأولى لشريكك؟',
    'q_vacation': 'ما هي وجهة العطلة المثالية لشريكك؟',
    'q_live': 'أين يرغب شريكك في العيش في المستقبل؟',
    'q_children': 'كم عدد الأطفال الذين يريدهم شريكك؟',
    'q_fear': 'ما هو أكبر خوف لشريكك؟',
    'q_dream': 'ما هو أكبر حلم أو هدف لشريكك؟',
    'q_relax': 'ماذا يفعل شريكك للاسترخاء؟',
    // Answer options
    'blue': 'أزرق',
    'red': 'أحمر',
    'green': 'أخضر',
    'purple': 'أرجواني',
    'black': 'أسود',
    'pizza': 'بيتزا',
    'pasta': 'معكرونة',
    'burgers': 'برغر', 
    'sushi': 'سوشي',
    'steak': 'ستيك',
    'comedy': 'كوميديا',
    'action': 'أكشن',
    'romance': 'رومانسي',
    'horror': 'رعب',
    'scifi': 'خيال علمي',
    'pop': 'بوب',
    'rock': 'روك',
    'hiphop': 'هيب هوب',
    'classical': 'كلاسيكي',
    'country': 'كانتري',
    'spring': 'الربيع',
    'summer': 'الصيف',
    'fall': 'الخريف',
    'winter': 'الشتاء',
    'smile': 'الابتسامة',
    'eyes': 'العيون',
    'voice': 'الصوت',
    'style': 'الأسلوب',
    'personality': 'الشخصية',
    'family_time': 'وقت العائلة',
    'achieve_goals': 'تحقيق الأهداف',
    'fun': 'المرح',
    'quiet_time': 'الوقت الهادئ',
    'being_with_you': 'التواجد معك',
    'touch': 'اللمس الجسدي',
    'quality_time': 'وقت ذو جودة',
    'words': 'كلمات التقدير',
    'acts': 'أعمال الخدمة',
    'gifts': 'الهدايا',
    'being_late': 'التأخير',
    'messiness': 'الفوضى',
    'rudeness': 'الوقاحة',
    'loud_noises': 'الضوضاء العالية',
    'interruptions': 'المقاطعة',
    'restaurant': 'مطعم',
    'movie_theater': 'سينما',
    'park': 'حديقة',
    'coffee_shop': 'مقهى',
    'beach': 'شاطئ',
    'blue_shirt': 'قميص أزرق',
    'jeans': 'جينز',
    'dress': 'فستان',
    'tshirt': 'تي شيرت',
    'dont_remember': 'لا أتذكر',
    'flowers': 'زهور',
    'jewelry': 'مجوهرات',
    'clothing': 'ملابس',
    'book': 'كتاب',
    'something_else': 'شيء آخر',
    'europe': 'أوروبا',
    'caribbean': 'الكاريبي',
    'asia': 'آسيا',
    'africa': 'إفريقيا',
    'south_america': 'أمريكا الجنوبية',
    'big_city': 'مدينة كبيرة',
    'suburb': 'ضاحية',
    'small_town': 'بلدة صغيرة',
    'rural': 'منطقة ريفية',
    'beach_town': 'مدينة ساحلية',
    'none': 'لا شيء',
    'one': '1',
    'two': '2',
    'three': '3',
    'four_plus': '4 أو أكثر',
    'heights': 'المرتفعات',
    'spiders': 'العناكب',
    'public_speaking': 'التحدث أمام الجمهور',
    'failure': 'الفشل',
    'being_alone': 'الوحدة',
    'career': 'النجاح المهني',
    'travel': 'السفر حول العالم',
    'start_family': 'تكوين أسرة',
    'finance': 'الحرية المالية',
    'make_difference': 'إحداث فرق',
    'reading': 'القراءة',
    'watching_tv': 'مشاهدة التلفاز',
    'exercise': 'الرياضة',
    'music': 'الموسيقى',
    'sleep': 'النوم',
  }
};

// Translation function
String translate(String key, String language) {
  if (translations.containsKey(language) && translations[language]!.containsKey(key)) {
    return translations[language]![key]!;
  }
  
  // Fallback to English
  if (translations['en']!.containsKey(key)) {
    return translations['en']![key]!;
  }
  
  // Return the key if no translation found
  return key;
}

// Question model for better organization
class Question {
  final String questionKey;
  final String categoryKey;
  final List<String> optionKeys;
  String player1Answer;
  String player2Answer;
  bool isMatched;
  
  Question({
    required this.questionKey,
    required this.categoryKey,
    required this.optionKeys,
    this.player1Answer = '',
    this.player2Answer = '',
    this.isMatched = false,
  });
}

// Categories of questions
enum QuestionCategory {
  preferences('preferences'),
  relationship('relationship'),
  memories('memories'),
  future('future'),
  personal('personal');
  
  final String translationKey;
  const QuestionCategory(this.translationKey);
  
  String getLabel(Language language) {
    return translate(translationKey, language.code);
  }
}

// Gender enum for UI customization
enum Gender {
  male,
  female
}

void main() {
  runApp(const CoupleQuizApp());
}

class CoupleQuizApp extends StatefulWidget {
  const CoupleQuizApp({super.key});

  @override
  State<CoupleQuizApp> createState() => _CoupleQuizAppState();
}

class _CoupleQuizAppState extends State<CoupleQuizApp> {
  Language _appLanguage = Language.english;

  void setLanguage(Language language) {
    setState(() {
      _appLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: translate('appTitle', _appLanguage.code),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: WelcomePage(
        language: _appLanguage,
        setLanguage: setLanguage,
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final Language language;
  final Function(Language) setLanguage;

  const WelcomePage({
    super.key, 
    required this.language,
    required this.setLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(translate('appTitle', language.code)),
        actions: [
          PopupMenuButton<Language>(
            icon: const Icon(Icons.language),
            onSelected: setLanguage,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<Language>>[
                for (var lang in Language.values)
                  PopupMenuItem<Language>(
                    value: lang,
                    child: Text(lang.displayName),
                  ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              translate('welcome', language.code),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              translate('tagline', language.code),
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/couple.png',
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.favorite, size: 100, color: Colors.pink);
              },
            ),
            const SizedBox(height: 40),
            
            // Language selection
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      translate('chooseLang', language.code),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        for (var lang in Language.values)
                          ChoiceChip(
                            label: Text(lang.displayName),
                            selected: language == lang,
                            onSelected: (bool selected) {
                              if (selected) {
                                setLanguage(lang);
                              }
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerSetupPage(
                      language: language,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                translate('startQuiz', language.code),
                style: const TextStyle(fontSize: 18)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerSetupPage extends StatefulWidget {
  final Language language;

  const PlayerSetupPage({
    super.key,
    required this.language,
  });

  @override
  State<PlayerSetupPage> createState() => _PlayerSetupPageState();
}

class _PlayerSetupPageState extends State<PlayerSetupPage> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();
  Gender _player1Gender = Gender.male;
  Gender _player2Gender = Gender.female;
  int _questionCount = 5; // Default to 5 questions
  List<QuestionCategory> _selectedCategories = QuestionCategory.values.toList();

  @override
  void dispose() {
    _player1Controller.dispose();
    _player2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(translate('playerSetup', widget.language.code)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                translate('enterNames', widget.language.code),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              
              // Player 1 setup
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translate('player1', widget.language.code), 
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _player1Controller,
                        decoration: InputDecoration(
                          labelText: translate('name', widget.language.code),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('${translate('gender', widget.language.code)}:', style: const TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                            groupValue: _player1Gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _player1Gender = value!;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          Text(translate('male', widget.language.code)),
                          const SizedBox(width: 16),
                          Radio<Gender>(
                            value: Gender.female,
                            groupValue: _player1Gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _player1Gender = value!;
                              });
                            },
                            activeColor: Colors.pink,
                          ),
                          Text(translate('female', widget.language.code)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Player 2 setup
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translate('player2', widget.language.code),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _player2Controller,
                        decoration: InputDecoration(
                          labelText: translate('name', widget.language.code),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('${translate('gender', widget.language.code)}:', style: const TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                            groupValue: _player2Gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _player2Gender = value!;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          Text(translate('male', widget.language.code)),
                          const SizedBox(width: 16),
                          Radio<Gender>(
                            value: Gender.female,
                            groupValue: _player2Gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _player2Gender = value!;
                              });
                            },
                            activeColor: Colors.pink,
                          ),
                          Text(translate('female', widget.language.code)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Question count selection
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translate('selectQuestionCount', widget.language.code),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildQuestionCountButton(5),
                          _buildQuestionCountButton(10),
                          _buildQuestionCountButton(15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Category selection
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translate('selectCategories', widget.language.code),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var category in QuestionCategory.values)
                            FilterChip(
                              label: Text(category.getLabel(widget.language)),
                              selected: _selectedCategories.contains(category),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedCategories.add(category);
                                  } else {
                                    // Don't allow deselecting all categories
                                    if (_selectedCategories.length > 1) {
                                      _selectedCategories.remove(category);
                                    }
                                  }
                                });
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              ElevatedButton(
                onPressed: () {
                  if (_player1Controller.text.isNotEmpty && _player2Controller.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          player1Name: _player1Controller.text,
                          player2Name: _player2Controller.text,
                          player1Gender: _player1Gender,
                          player2Gender: _player2Gender,
                          language: widget.language,
                          questionCount: _questionCount,
                          selectedCategories: _selectedCategories,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter both player names')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  translate('continueToQuiz', widget.language.code),
                  style: const TextStyle(fontSize: 18)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildQuestionCountButton(int count) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _questionCount = count;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _questionCount == count ? Colors.pink : Colors.grey.shade300,
        foregroundColor: _questionCount == count ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text('$count'),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String player1Name;
  final String player2Name;
  final Gender player1Gender;
  final Gender player2Gender;
  final Language language;
  final int questionCount;
  final List<QuestionCategory> selectedCategories;

  const QuizPage({
    super.key,
    required this.player1Name,
    required this.player2Name,
    required this.player1Gender,
    required this.player2Gender,
    required this.language,
    required this.questionCount,
    required this.selectedCategories,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  bool _isPlayer1Turn = true;
  String _selectedAnswer = '';
  int _score = 0;
  late List<Question> _questions;
  
  // Timer related variables
  int _timeLeft = 30; // 30 seconds per question
  late Timer _timer;
  bool _isTimerActive = true;
  
  @override
  void initState() {
    super.initState();
    _initializeQuestions();
    _startTimer();
  }
  
  void _initializeQuestions() {
    // Create a larger pool of questions with multiple choice options
    List<Question> allQuestions = [
      // Preferences category
      Question(
        questionKey: 'q_color',
        categoryKey: QuestionCategory.preferences.translationKey,
        optionKeys: ['blue', 'red', 'green', 'purple', 'black'],
      ),
      Question(
        questionKey: 'q_food',
        categoryKey: QuestionCategory.preferences.translationKey,
        optionKeys: ['pizza', 'pasta', 'burgers', 'sushi', 'steak'],
      ),
      Question(
        questionKey: 'q_movie',
        categoryKey: QuestionCategory.preferences.translationKey,
        optionKeys: ['comedy', 'action', 'romance', 'horror', 'scifi'],
      ),
      Question(
        questionKey: 'q_music',
        categoryKey: QuestionCategory.preferences.translationKey,
        optionKeys: ['pop', 'rock', 'hiphop', 'classical', 'country'],
      ),
      Question(
        questionKey: 'q_season',
        categoryKey: QuestionCategory.preferences.translationKey,
        optionKeys: ['spring', 'summer', 'fall', 'winter'],
      ),
      
      // Relationship category
      Question(
        questionKey: 'q_notice',
        categoryKey: QuestionCategory.relationship.translationKey,
        optionKeys: ['smile', 'eyes', 'voice', 'style', 'personality'],
      ),
      Question(
        questionKey: 'q_happiest',
        categoryKey: QuestionCategory.relationship.translationKey,
        optionKeys: ['family_time', 'achieve_goals', 'fun', 'quiet_time', 'being_with_you'],
      ),
      Question(
        questionKey: 'q_love_language',
        categoryKey: QuestionCategory.relationship.translationKey,
        optionKeys: ['touch', 'quality_time', 'words', 'acts', 'gifts'],
      ),
      Question(
        questionKey: 'q_annoys',
        categoryKey: QuestionCategory.relationship.translationKey,
        optionKeys: ['being_late', 'messiness', 'rudeness', 'loud_noises', 'interruptions'],
      ),
      
      // Memories category
      Question(
        questionKey: 'q_first_date',
        categoryKey: QuestionCategory.memories.translationKey,
        optionKeys: ['restaurant', 'movie_theater', 'park', 'coffee_shop', 'beach'],
      ),
      Question(
        questionKey: 'q_first_met',
        categoryKey: QuestionCategory.memories.translationKey,
        optionKeys: ['blue_shirt', 'jeans', 'dress', 'tshirt', 'dont_remember'],
      ),
      Question(
        questionKey: 'q_first_gift',
        categoryKey: QuestionCategory.memories.translationKey,
        optionKeys: ['flowers', 'jewelry', 'clothing', 'book', 'something_else'],
      ),
      
      // Future Plans category
      Question(
        questionKey: 'q_vacation',
        categoryKey: QuestionCategory.future.translationKey,
        optionKeys: ['europe', 'caribbean', 'asia', 'africa', 'south_america'],
      ),
      Question(
        questionKey: 'q_live',
        categoryKey: QuestionCategory.future.translationKey,
        optionKeys: ['big_city', 'suburb', 'small_town', 'rural', 'beach_town'],
      ),
      Question(
        questionKey: 'q_children',
        categoryKey: QuestionCategory.future.translationKey,
        optionKeys: ['none', 'one', 'two', 'three', 'four_plus'],
      ),
      
      // Personal category
      Question(
        questionKey: 'q_fear',
        categoryKey: QuestionCategory.personal.translationKey,
        optionKeys: ['heights', 'spiders', 'public_speaking', 'failure', 'being_alone'],
      ),
      Question(
        questionKey: 'q_dream',
        categoryKey: QuestionCategory.personal.translationKey,
        optionKeys: ['career', 'travel', 'start_family', 'finance', 'make_difference'],
      ),
      Question(
        questionKey: 'q_relax',
        categoryKey: QuestionCategory.personal.translationKey,
        optionKeys: ['reading', 'watching_tv', 'exercise', 'music', 'sleep'],
      ),
    ];
    
    // Filter questions by selected categories
    List<Question> filteredQuestions = allQuestions.where((q) => 
      widget.selectedCategories.any((cat) => cat.translationKey == q.categoryKey)
    ).toList();
    
    // Shuffle and select the requested number
    filteredQuestions.shuffle();
    _questions = filteredQuestions.take(widget.questionCount).toList();
  }
  
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _submitAnswer(timeOut: true);
      }
    });
  }
  
  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _timeLeft = 30;
      _isTimerActive = true;
      _selectedAnswer = '';
    });
    _startTimer();
  }
  
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _submitAnswer({bool timeOut = false}) {
    if (_selectedAnswer.isEmpty) {
      // Show error message if no answer is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(translate('selectAnswerPrompt', widget.language.code)),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }
    
    // Assign the selected answer to the current player
    if (_isPlayer1Turn) {
      _questions[_currentQuestionIndex].player1Answer = _selectedAnswer;
    } else {
      _questions[_currentQuestionIndex].player2Answer = _selectedAnswer;
      
      // Check if the answers match
      if (_questions[_currentQuestionIndex].player1Answer == 
          _questions[_currentQuestionIndex].player2Answer) {
        setState(() {
          _score++;
          _questions[_currentQuestionIndex].isMatched = true;
        });
      }
    }
    
    _timer.cancel();  // Cancel the current timer
    
    setState(() {
      if (_isPlayer1Turn) {
        // Switch to player 2
        _isPlayer1Turn = false;
        _selectedAnswer = '';
        _timeLeft = 30;
        _startTimer();
      } else {
        // Check if we've completed all questions
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
          _isPlayer1Turn = true;
          _selectedAnswer = '';
          _timeLeft = 30;
          _startTimer();
        } else {
          // End of quiz
          _navigateToResults();
        }
      }
    });
  }

  void _navigateToResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          player1Name: widget.player1Name,
          player2Name: widget.player2Name,
          player1Gender: widget.player1Gender,
          player2Gender: widget.player2Gender,
          language: widget.language,
          questions: _questions,
          score: _score,
          maxScore: _questions.length * 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayerName = _isPlayer1Turn ? widget.player1Name : widget.player2Name;
    final currentPlayerGender = _isPlayer1Turn ? widget.player1Gender : widget.player2Gender;
    final backgroundColor = currentPlayerGender == Gender.male ? 
                            Colors.blue.shade50 : Colors.pink.shade50;
    final accentColor = currentPlayerGender == Gender.male ? 
                        Colors.blue : Colors.pink;
    
    // Get current question options
    List<String> optionKeys = _questions[_currentQuestionIndex].optionKeys;
    
    // For RTL languages like Arabic
    TextDirection textDirection = widget.language == Language.arabic ? 
                                TextDirection.rtl : TextDirection.ltr;
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text('${currentPlayerName}\'s ${translate('question', widget.language.code)}'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '${translate('score', widget.language.code)}: $_score',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: textDirection,
          children: [
            // Timer indicator
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _timeLeft / 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: _timeLeft > 10 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${translate('timeLeft', widget.language.code)}: $_timeLeft ${translate('seconds', widget.language.code)}',
              style: TextStyle(
                color: _timeLeft > 10 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // Question progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${translate('question', widget.language.code)} ${_currentQuestionIndex + 1}/${_questions.length}',
                  style: const TextStyle(fontSize: 18),
                ),
                Chip(
                  label: Text(translate(_questions[_currentQuestionIndex].categoryKey, widget.language)),
                  backgroundColor: accentColor.withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Question
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      translate(_questions[_currentQuestionIndex].questionKey, widget.language.code),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    if (_isPlayer1Turn)
                      const Text(
                        "Answer what you think your partner would say!",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Multiple choice options
            Expanded(
              child: ListView.builder(
                itemCount: optionKeys.length,
                itemBuilder: (context, index) {
                  String optionKey = optionKeys[index];
                  String translatedOption = translate(optionKey, widget.language.code);
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAnswer = optionKey;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedAnswer == optionKey ? 
                                accentColor.withOpacity(0.2) : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedAnswer == optionKey ? 
                                  accentColor : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: optionKey,
                              groupValue: _selectedAnswer,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedAnswer = value!;
                                });
                              },
                              activeColor: accentColor,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                translatedOption,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: _selectedAnswer == optionKey ? 
                                              FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Submit button
            ElevatedButton(
              onPressed: _submitAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                translate('submitAnswer', widget.language.code),
                style: const TextStyle(fontSize: 18)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  final String player1Name;
  final String player2Name;
  final Gender player1Gender;
  final Gender player2Gender;
  final Language language;
  final List<Question> questions;
  final int score;
  final int maxScore;

  const ResultsPage({
    super.key,
    required this.player1Name,
    required this.player2Name,
    required this.player1Gender,
    required this.player2Gender,
    required this.language,
    required this.questions,
    required this.score,
    required this.maxScore,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / maxScore * 100).round();
    String resultMessage;
    Color resultColor;
    
    if (percentage >= 80) {
      resultMessage = "Perfect Match! You know each other incredibly well!";
      resultColor = Colors.green;
    } else if (percentage >= 60) {
      resultMessage = "Great Job! You have a strong connection!";
      resultColor = Colors.blue;
    } else if (percentage >= 40) {
      resultMessage = "Not bad! You're on your way to understanding each other better.";
      resultColor = Colors.orange;
    } else {
      resultMessage = "You have some learning to do! Time to get to know each other better.";
      resultColor = Colors.red;
    }
    
    // For RTL languages like Arabic
    TextDirection textDirection = language == Language.arabic ? 
                                TextDirection.rtl : TextDirection.ltr;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(translate('quizResults', language.code)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          textDirection: textDirection,
          children: [
            // Score display
            Card(
              elevation: 4,
              color: resultColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Your Couple Score: $score/$maxScore',
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold,
                        color: resultColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$percentage% Match',
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold,
                        color: resultColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      resultMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: resultColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            Text(
              translate('questionResults', language.code),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 10),
            
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 2,
                    color: question.isMatched ? 
                           Colors.green.shade50 : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: textDirection,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${translate('question', language.code)} ${index + 1}: ${translate(question.questionKey, language.code)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Chip(
                                label: Text(translate(question.categoryKey, language.code)),
                                backgroundColor: Colors.grey.shade200,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                player1Gender == Gender.male ? 
                                Icons.male : Icons.female,
                                color: player1Gender == Gender.male ? 
                                       Colors.blue : Colors.pink,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '$player1Name ${translate('answered', language.code)}: "${translate(question.player1Answer, language.code)}"',
                                style: TextStyle(
                                  color: player1Gender == Gender.male ? 
                                         Colors.blue.shade800 : Colors.pink.shade800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                player2Gender == Gender.male ? 
                                Icons.male : Icons.female,
                                color: player2Gender == Gender.male ? 
                                       Colors.blue : Colors.pink,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '$player2Name ${translate('answered', language.code)}: "${translate(question.player2Answer, language.code)}"',
                                style: TextStyle(
                                  color: player2Gender == Gender.male ? 
                                         Colors.blue.shade800 : Colors.pink.shade800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              question.isMatched ? 
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.check, color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      translate('match', language.code), 
                                      style: const TextStyle(color: Colors.white)
                                    ),
                                  ],
                                ),
                              ) :
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.close, color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      translate('noMatch', language.code), 
                                      style: const TextStyle(color: Colors.white)
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                translate('startNewQuiz', language.code),
                style: const TextStyle(fontSize: 18)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
