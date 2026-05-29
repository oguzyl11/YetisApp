import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const YetisApp());
}

class YetisApp extends StatelessWidget {
  const YetisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yetiş',
      debugShowCheckedModeBanner:
          false, // Sağ üstteki "Debug" şeridini kaldırır
      theme: ThemeData(
        useMaterial3: true,
        // Markamızın ana renk paletini tanımlıyoruz
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005440),
          primary: const Color(0xFF005440),
          secondary: const Color(0xFF0F6E56),
          background: const Color(0xFFFCF9F8),
        ),
        fontFamily: 'Roboto', // Evrensel ve temiz bir font
      ),
      // Uygulama ilk açıldığında gösterilecek başlangıç ekranı
      home: const OnboardingScreen(),
    );
  }
}
