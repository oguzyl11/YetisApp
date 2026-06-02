import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
// import 'screens/home_screen.dart'; // Bu dosyayı da oluşturduğunda yorumu kaldır

void main() {
  runApp(YetisApp());
}

class YetisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YetişApp',
      theme: ThemeData(
        primarySwatch:
            Colors.green, // Gıda israfını önleme konseptine uygun bir renk
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        // Rotaları (ekranları) burada tanımlıyoruz
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        // '/home': (context) => HomeScreen(),
      },
    );
  }
}
