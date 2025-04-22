import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Center(
                child: Text(
                  'Couple Quiz',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Select Language / Choisir la langue / اختر اللغة',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              _buildLanguageButton(
                context, 
                'English', 
                'en',
                Colors.blue.shade100,
              ),
              const SizedBox(height: 20),
              _buildLanguageButton(
                context, 
                'Français', 
                'fr',
                Colors.blue.shade200,
              ),
              const SizedBox(height: 20),
              _buildLanguageButton(
                context, 
                'العربية', 
                'ar',
                Colors.blue.shade300,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(
    BuildContext context, 
    String label, 
    String languageCode,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () async {
        // Set the selected language using the provider
        final quizProvider = Provider.of<QuizProvider>(context, listen: false);
        await quizProvider.setLocale(languageCode);
        
        // Navigate to home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 