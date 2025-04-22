import '../models/question.dart';

class QuestionsData {
  static List<Question> getAllQuestions() {
    return [
      Question(
        id: 'q1',
        text: {
          'en': 'What is your favorite color?',
          'fr': 'Quelle est votre couleur préférée?',
          'ar': 'ما هو لونك المفضل؟',
        },
        options: [
          {
            'en': 'Blue',
            'fr': 'Bleu',
            'ar': 'أزرق',
          },
          {
            'en': 'Red',
            'fr': 'Rouge',
            'ar': 'أحمر',
          },
          {
            'en': 'Green',
            'fr': 'Vert',
            'ar': 'أخضر',
          },
        ],
      ),
      Question(
        id: 'q2',
        text: {
          'en': 'What is your ideal vacation spot?',
          'fr': 'Quel est votre lieu de vacances idéal?',
          'ar': 'ما هي وجهة عطلتك المثالية؟',
        },
        options: [
          {
            'en': 'Beach',
            'fr': 'Plage',
            'ar': 'شاطئ',
          },
          {
            'en': 'Mountains',
            'fr': 'Montagnes',
            'ar': 'جبال',
          },
          {
            'en': 'City',
            'fr': 'Ville',
            'ar': 'مدينة',
          },
        ],
      ),
      Question(
        id: 'q3',
        text: {
          'en': 'What is your favorite food?',
          'fr': 'Quel est votre plat préféré?',
          'ar': 'ما هو طعامك المفضل؟',
        },
        options: [
          {
            'en': 'Pizza',
            'fr': 'Pizza',
            'ar': 'بيتزا',
          },
          {
            'en': 'Sushi',
            'fr': 'Sushi',
            'ar': 'سوشي',
          },
          {
            'en': 'Steak',
            'fr': 'Steak',
            'ar': 'ستيك',
          },
        ],
      ),
      Question(
        id: 'q4',
        text: {
          'en': 'What\'s your favorite season?',
          'fr': 'Quelle est votre saison préférée?',
          'ar': 'ما هو فصلك المفضل من السنة؟',
        },
        options: [
          {
            'en': 'Summer',
            'fr': 'Été',
            'ar': 'الصيف',
          },
          {
            'en': 'Winter',
            'fr': 'Hiver',
            'ar': 'الشتاء',
          },
          {
            'en': 'Autumn',
            'fr': 'Automne',
            'ar': 'الخريف',
          },
        ],
      ),
      Question(
        id: 'q5',
        text: {
          'en': 'What\'s your preferred way to spend a weekend?',
          'fr': 'Comment préférez-vous passer un week-end?',
          'ar': 'ما هي طريقتك المفضلة لقضاء عطلة نهاية الأسبوع؟',
        },
        options: [
          {
            'en': 'At home relaxing',
            'fr': 'À la maison en se relaxant',
            'ar': 'في المنزل للاسترخاء',
          },
          {
            'en': 'Going out with friends',
            'fr': 'Sortir avec des amis',
            'ar': 'الخروج مع الأصدقاء',
          },
          {
            'en': 'Outdoor adventure',
            'fr': 'Aventure en plein air',
            'ar': 'مغامرة في الهواء الطلق',
          },
        ],
      ),
      // Adding more questions to reach at least 10 for this sample
      Question(
        id: 'q6',
        text: {
          'en': 'What type of movie do you prefer?',
          'fr': 'Quel type de film préférez-vous?',
          'ar': 'ما نوع الأفلام التي تفضلها؟',
        },
        options: [
          {
            'en': 'Comedy',
            'fr': 'Comédie',
            'ar': 'كوميديا',
          },
          {
            'en': 'Action',
            'fr': 'Action',
            'ar': 'أكشن',
          },
          {
            'en': 'Drama',
            'fr': 'Drame',
            'ar': 'دراما',
          },
        ],
      ),
      Question(
        id: 'q7',
        text: {
          'en': 'What\'s your idea of a perfect date?',
          'fr': 'Quelle est votre idée d\'un rendez-vous parfait?',
          'ar': 'ما هي فكرتك عن الموعد المثالي؟',
        },
        options: [
          {
            'en': 'Romantic dinner',
            'fr': 'Dîner romantique',
            'ar': 'عشاء رومانسي',
          },
          {
            'en': 'Movie and ice cream',
            'fr': 'Film et glace',
            'ar': 'فيلم وآيس كريم',
          },
          {
            'en': 'Adventure activity',
            'fr': 'Activité d\'aventure',
            'ar': 'نشاط مغامرة',
          },
        ],
      ),
      Question(
        id: 'q8',
        text: {
          'en': 'What pet would you prefer to have?',
          'fr': 'Quel animal de compagnie préféreriez-vous avoir?',
          'ar': 'ما هو الحيوان الأليف الذي تفضل أن يكون لديك؟',
        },
        options: [
          {
            'en': 'Dog',
            'fr': 'Chien',
            'ar': 'كلب',
          },
          {
            'en': 'Cat',
            'fr': 'Chat',
            'ar': 'قطة',
          },
          {
            'en': 'No pets',
            'fr': 'Pas d\'animaux',
            'ar': 'لا حيوانات أليفة',
          },
        ],
      ),
      Question(
        id: 'q9',
        text: {
          'en': 'How do you prefer to communicate with your partner?',
          'fr': 'Comment préférez-vous communiquer avec votre partenaire?',
          'ar': 'كيف تفضل التواصل مع شريكك؟',
        },
        options: [
          {
            'en': 'In person',
            'fr': 'En personne',
            'ar': 'وجها لوجه',
          },
          {
            'en': 'Text messages',
            'fr': 'Messages texte',
            'ar': 'رسائل نصية',
          },
          {
            'en': 'Phone calls',
            'fr': 'Appels téléphoniques',
            'ar': 'مكالمات هاتفية',
          },
        ],
      ),
      Question(
        id: 'q10',
        text: {
          'en': 'What\'s your preferred way to show affection?',
          'fr': 'Quelle est votre façon préférée de montrer de l\'affection?',
          'ar': 'ما هي طريقتك المفضلة لإظهار المودة؟',
        },
        options: [
          {
            'en': 'Physical touch',
            'fr': 'Contact physique',
            'ar': 'اللمس الجسدي',
          },
          {
            'en': 'Verbal affirmation',
            'fr': 'Affirmation verbale',
            'ar': 'التأكيد اللفظي',
          },
          {
            'en': 'Giving gifts',
            'fr': 'Offrir des cadeaux',
            'ar': 'تقديم الهدايا',
          },
        ],
      ),
      // In a real app, you would add 90 more questions to reach 100
      // For brevity, we'll consider these 10 as representative of the full set
    ];
  }
} 