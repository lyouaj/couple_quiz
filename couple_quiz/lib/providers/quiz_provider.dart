import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';
import '../utils/questions_data.dart';

class QuizProvider extends ChangeNotifier {
  // Locale management
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  // Quiz state
  List<Question> _quizQuestions = [];
  int _currentPartner = 1; // 1 for A, 2 for B
  int _currentQuestionIndex = 0;
  
  // Answers
  Map<String, int> _partnerAAnswers = {};
  Map<String, int> _partnerBAnswers = {};
  
  // Results
  int _matchingScore = 0;
  bool _quizCompleted = false;

  // Getters
  List<Question> get quizQuestions => _quizQuestions;
  int get currentPartner => _currentPartner;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question get currentQuestion => _quizQuestions[_currentQuestionIndex];
  Map<String, int> get partnerAAnswers => _partnerAAnswers;
  Map<String, int> get partnerBAnswers => _partnerBAnswers;
  int get matchingScore => _matchingScore;
  bool get quizCompleted => _quizCompleted;
  bool get canProceedToNextQuestion => 
      (_currentPartner == 1 && _partnerAAnswers.containsKey(_quizQuestions[_currentQuestionIndex].id)) ||
      (_currentPartner == 2 && _partnerBAnswers.containsKey(_quizQuestions[_currentQuestionIndex].id));

  // Initialize provider and load saved locale
  Future<void> init() async {
    await _loadLocale();
  }

  // Change language and save preference
  Future<void> setLocale(String languageCode) async {
    _locale = Locale(languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    notifyListeners();
  }

  // Load saved locale from shared preferences
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String languageCode = prefs.getString('language_code') ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }

  // Start a new quiz by selecting 5 random questions
  void startQuiz() {
    final random = Random();
    // Create a copy of the full question list to avoid modifying the original
    final allQuestions = List<Question>.from(QuestionsData.getAllQuestions());
    // Shuffle the questions and take the first 5
    allQuestions.shuffle(random);
    _quizQuestions = allQuestions.take(5).toList();
    
    // Reset state
    _currentPartner = 1;
    _currentQuestionIndex = 0;
    _partnerAAnswers = {};
    _partnerBAnswers = {};
    _quizCompleted = false;
    _matchingScore = 0;
    
    notifyListeners();
  }

  // Record an answer for the current partner and question
  void answerQuestion(int answerIndex) {
    final questionId = _quizQuestions[_currentQuestionIndex].id;
    
    if (_currentPartner == 1) {
      _partnerAAnswers[questionId] = answerIndex;
    } else {
      _partnerBAnswers[questionId] = answerIndex;
    }
    
    notifyListeners();
  }

  // Move to the next question or partner
  void nextQuestion() {
    if (_currentQuestionIndex < _quizQuestions.length - 1) {
      // Move to next question
      _currentQuestionIndex++;
    } else if (_currentPartner == 1) {
      // First partner finished, switch to second partner
      _currentPartner = 2;
      _currentQuestionIndex = 0;
    } else {
      // Both partners finished, calculate score
      _calculateScore();
      _quizCompleted = true;
    }
    
    notifyListeners();
  }

  // Calculate the matching score
  void _calculateScore() {
    int matchCount = 0;
    
    for (final question in _quizQuestions) {
      final partnerAAnswer = _partnerAAnswers[question.id];
      final partnerBAnswer = _partnerBAnswers[question.id];
      
      if (partnerAAnswer != null && partnerBAnswer != null && partnerAAnswer == partnerBAnswer) {
        matchCount++;
      }
    }
    
    _matchingScore = (matchCount / _quizQuestions.length * 100).round();
  }

  // Reset the quiz to play again
  void resetQuiz() {
    _quizQuestions = [];
    _currentPartner = 1;
    _currentQuestionIndex = 0;
    _partnerAAnswers = {};
    _partnerBAnswers = {};
    _quizCompleted = false;
    _matchingScore = 0;
    
    notifyListeners();
  }
} 