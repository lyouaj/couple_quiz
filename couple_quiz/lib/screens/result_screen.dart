import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/question.dart';
import '../providers/quiz_provider.dart';
import '../utils/app_localizations.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final localizations = AppLocalizations(quizProvider.locale);
    final languageCode = quizProvider.locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.score),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Score display
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _getScoreColor(quizProvider.matchingScore),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      localizations.matchedScore(quizProvider.matchingScore),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Icon(
                      _getScoreIcon(quizProvider.matchingScore),
                      size: 48,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Comparison list
              Text(
                'Answer Comparison',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              // Header
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Question',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      localizations.partnerA,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      localizations.partnerB,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              
              // List of questions and answers
              Expanded(
                child: ListView.builder(
                  itemCount: quizProvider.quizQuestions.length,
                  itemBuilder: (context, index) {
                    final Question question = quizProvider.quizQuestions[index];
                    final String questionText = question.getQuestionText(languageCode);
                    final List<String> options = question.getOptions(languageCode);
                    
                    final int? partnerAAnswerIndex = quizProvider.partnerAAnswers[question.id];
                    final int? partnerBAnswerIndex = quizProvider.partnerBAnswers[question.id];
                    
                    final String partnerAAnswer = partnerAAnswerIndex != null && partnerAAnswerIndex >= 0 && partnerAAnswerIndex < options.length
                        ? options[partnerAAnswerIndex]
                        : '-';
                    
                    final String partnerBAnswer = partnerBAnswerIndex != null && partnerBAnswerIndex >= 0 && partnerBAnswerIndex < options.length
                        ? options[partnerBAnswerIndex]
                        : '-';
                    
                    final bool isMatching = partnerAAnswerIndex != null && 
                                           partnerBAnswerIndex != null && 
                                           partnerAAnswerIndex == partnerBAnswerIndex;
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question
                          Expanded(
                            flex: 3,
                            child: Text(
                              questionText,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          
                          // Partner A Answer
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isMatching ? Colors.green.withOpacity(0.2) : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                partnerAAnswer,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          
                          // Partner B Answer
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isMatching ? Colors.green.withOpacity(0.2) : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                partnerBAnswer,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Play Again button
              ElevatedButton.icon(
                onPressed: () {
                  // Reset the quiz
                  quizProvider.resetQuiz();
                  
                  // Navigate back to home screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.replay, size: 24),
                label: Text(
                  localizations.playAgain,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.blue;
    if (score >= 40) return Colors.orange;
    return Colors.red;
  }

  IconData _getScoreIcon(int score) {
    if (score >= 80) return Icons.favorite;
    if (score >= 60) return Icons.sentiment_satisfied;
    if (score >= 40) return Icons.sentiment_neutral;
    return Icons.sentiment_dissatisfied;
  }
} 