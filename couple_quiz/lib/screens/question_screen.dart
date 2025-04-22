import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/app_localizations.dart';
import 'result_screen.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final localizations = AppLocalizations(quizProvider.locale);
    
    // Check if we have questions
    if (quizProvider.quizQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(localizations.appTitle),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    final currentQuestion = quizProvider.currentQuestion;
    final options = currentQuestion.getOptions(quizProvider.locale.languageCode);
    final questionText = currentQuestion.getQuestionText(quizProvider.locale.languageCode);
    
    // Determine which partner is answering
    final partnerLabel = quizProvider.currentPartner == 1 
        ? localizations.partnerA 
        : localizations.partnerB;
    
    // Determine which answer is selected (if any)
    final Map<String, int> currentPartnerAnswers = quizProvider.currentPartner == 1 
        ? quizProvider.partnerAAnswers 
        : quizProvider.partnerBAnswers;
    
    final selectedAnswerIndex = currentPartnerAnswers[currentQuestion.id];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(partnerLabel),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (quizProvider.currentQuestionIndex + 1) / quizProvider.quizQuestions.length,
                backgroundColor: Colors.grey[200],
                color: Colors.blue,
              ),
              const SizedBox(height: 8),
              Text(
                localizations.questionProgress(quizProvider.currentQuestionIndex + 1),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              Text(
                questionText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedAnswerIndex == index;
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildOptionButton(
                        context,
                        options[index],
                        index,
                        isSelected,
                        () {
                          // Record the answer
                          quizProvider.answerQuestion(index);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: quizProvider.canProceedToNextQuestion 
                    ? () {
                        quizProvider.nextQuestion();
                        
                        // If quiz is completed, navigate to results screen
                        if (quizProvider.quizCompleted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const ResultScreen()),
                          );
                        }
                      } 
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  quizProvider.currentQuestionIndex < quizProvider.quizQuestions.length - 1
                      ? localizations.next
                      : localizations.done,
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

  Widget _buildOptionButton(
    BuildContext context,
    String label,
    int index,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
} 