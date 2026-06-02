import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const YetisApp());
}

class YetisApp extends StatelessWidget {
  const YetisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YetişApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Uygulama ilk açıldığında onboarding_screen tetiklenecek
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        // Backend entegrasyonu tamamlandığında buralara login ve register ekranlarını bağlayacaksın:
        // '/login': (context) => const LoginScreen(),
        // '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
