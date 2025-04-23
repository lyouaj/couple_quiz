import 'package:flutter/material.dart';
import 'dart:async';

// Question model for better organization
class Question {
  final String question;
  final String category;
  String player1Answer;
  String player2Answer;
  bool isMatched;
  
  Question({
    required this.question, 
    required this.category,
    this.player1Answer = '',
    this.player2Answer = '',
    this.isMatched = false,
  });
}

// Categories of questions
enum QuestionCategory {
  preferences('Preferences'),
  relationship('Relationship'),
  memories('Memories'),
  future('Future Plans'),
  personal('Personal');
  
  final String label;
  const QuestionCategory(this.label);
}

// Gender enum for UI customization
enum Gender {
  male,
  female
}

void main() {
  runApp(const CoupleQuizApp());
}

class CoupleQuizApp extends StatelessWidget {
  const CoupleQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couple Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Couple Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Couple Quiz!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Test how well you know each other',
              style: TextStyle(fontSize: 18),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayerSetupPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerSetupPage extends StatefulWidget {
  const PlayerSetupPage({super.key});

  @override
  State<PlayerSetupPage> createState() => _PlayerSetupPageState();
}

class _PlayerSetupPageState extends State<PlayerSetupPage> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();
  Gender _player1Gender = Gender.male;
  Gender _player2Gender = Gender.female;

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
        title: const Text('Player Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Enter Player Names',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      const Text('Player 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _player1Controller,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Gender:', style: TextStyle(fontSize: 16)),
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
                          const Text('Male'),
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
                          const Text('Female'),
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
                      const Text('Player 2', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _player2Controller,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Gender:', style: TextStyle(fontSize: 16)),
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
                          const Text('Male'),
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
                          const Text('Female'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Category selection
              const Text(
                'Select Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var category in QuestionCategory.values)
                    FilterChip(
                      label: Text(category.label),
                      selected: true, // All selected by default
                      onSelected: (bool selected) {
                        // Implement category filtering if needed
                      },
                    ),
                ],
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
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter both player names')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Continue to Quiz', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String player1Name;
  final String player2Name;
  final Gender player1Gender;
  final Gender player2Gender;

  const QuizPage({
    super.key,
    required this.player1Name,
    required this.player2Name,
    required this.player1Gender,
    required this.player2Gender,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  bool _isPlayer1Turn = true;
  final TextEditingController _answerController = TextEditingController();
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
    _questions = [
      // Preferences category
      Question(
        question: 'What is your partner\'s favorite color?',
        category: QuestionCategory.preferences.label,
      ),
      Question(
        question: 'What is your partner\'s favorite food?',
        category: QuestionCategory.preferences.label,
      ),
      Question(
        question: 'What is your partner\'s favorite movie?',
        category: QuestionCategory.preferences.label,
      ),
      Question(
        question: 'What is your partner\'s favorite music genre?',
        category: QuestionCategory.preferences.label,
      ),
      
      // Relationship category
      Question(
        question: 'What did you first notice about your partner?',
        category: QuestionCategory.relationship.label,
      ),
      Question(
        question: 'What makes your partner happiest?',
        category: QuestionCategory.relationship.label,
      ),
      Question(
        question: 'What is your partner\'s love language?',
        category: QuestionCategory.relationship.label,
      ),
      
      // Memories category
      Question(
        question: 'When was our first date?',
        category: QuestionCategory.memories.label,
      ),
      Question(
        question: 'What was your partner wearing when you first met?',
        category: QuestionCategory.memories.label,
      ),
      
      // Future Plans category
      Question(
        question: 'What is your partner\'s dream vacation destination?',
        category: QuestionCategory.future.label,
      ),
      Question(
        question: 'Where does your partner want to live in the future?',
        category: QuestionCategory.future.label,
      ),
      
      // Personal category
      Question(
        question: 'What is your partner\'s biggest fear?',
        category: QuestionCategory.personal.label,
      ),
      Question(
        question: 'What is your partner\'s biggest dream or goal?',
        category: QuestionCategory.personal.label,
      ),
    ];
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
    });
    _startTimer();
  }
  
  @override
  void dispose() {
    _answerController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _submitAnswer({bool timeOut = false}) {
    String answer = _answerController.text;
    
    if (timeOut) {
      answer = "(Time Out!)";
    } else if (answer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an answer')),
      );
      return;
    }

    setState(() {
      if (_isPlayer1Turn) {
        _questions[_currentQuestionIndex].player1Answer = answer;
      } else {
        _questions[_currentQuestionIndex].player2Answer = answer;
        
        // Check for match after player 2 answers
        String p1Answer = _questions[_currentQuestionIndex].player1Answer.toLowerCase().trim();
        String p2Answer = answer.toLowerCase().trim();
        
        // Simple matching logic - can be improved
        bool isMatch = p1Answer == p2Answer || 
                      (p1Answer.length > 3 && p2Answer.contains(p1Answer)) || 
                      (p2Answer.length > 3 && p1Answer.contains(p2Answer));
        
        _questions[_currentQuestionIndex].isMatched = isMatch;
        
        if (isMatch) {
          _score += 10; // 10 points per match
        }
        
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          // Quiz completed, show results
          _timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                player1Name: widget.player1Name,
                player2Name: widget.player2Name,
                player1Gender: widget.player1Gender,
                player2Gender: widget.player2Gender,
                questions: _questions,
                score: _score,
                maxScore: _questions.length * 10,
              ),
            ),
          );
          return;
        }
      }
      
      _isPlayer1Turn = !_isPlayer1Turn;
      _answerController.clear();
      _resetTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayerName = _isPlayer1Turn ? widget.player1Name : widget.player2Name;
    final currentPlayerGender = _isPlayer1Turn ? widget.player1Gender : widget.player2Gender;
    final backgroundColor = currentPlayerGender == Gender.male ? 
                            Colors.blue.shade50 : Colors.pink.shade50;
    final accentColor = currentPlayerGender == Gender.male ? 
                        Colors.blue : Colors.pink;
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text('${currentPlayerName}\'s Turn'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Score: $_score',
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
              'Time left: $_timeLeft seconds',
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
                  'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                  style: const TextStyle(fontSize: 18),
                ),
                Chip(
                  label: Text(_questions[_currentQuestionIndex].category),
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
                      _questions[_currentQuestionIndex].question,
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
            const SizedBox(height: 40),
            
            // Answer field
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Your Answer',
                border: const OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: accentColor, width: 2.0),
                ),
              ),
              onSubmitted: (_) => _submitAnswer(),
            ),
            const SizedBox(height: 30),
            
            // Submit button
            ElevatedButton(
              onPressed: _submitAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Submit Answer', style: TextStyle(fontSize: 18)),
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
  final List<Question> questions;
  final int score;
  final int maxScore;

  const ResultsPage({
    super.key,
    required this.player1Name,
    required this.player2Name,
    required this.player1Gender,
    required this.player2Gender,
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
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quiz Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
            
            const Text(
              'Question Results',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Question ${index + 1}: ${question.question}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Chip(
                                label: Text(question.category),
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
                                '$player1Name answered: "${question.player1Answer}"',
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
                                '$player2Name answered: "${question.player2Answer}"',
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
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check, color: Colors.white, size: 16),
                                    SizedBox(width: 4),
                                    Text('Match! +10 points', style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ) :
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.close, color: Colors.white, size: 16),
                                    SizedBox(width: 4),
                                    Text('No Match', style: TextStyle(color: Colors.white)),
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
              child: const Text('Start New Quiz', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
