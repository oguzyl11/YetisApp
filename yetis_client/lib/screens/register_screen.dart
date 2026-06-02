import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Node.js Express backend'ine istek atan fonksiyon
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Backend URL'ini kendi sunucu adresine göre güncelle (örn: 10.0.2.2 Android emülatör içindir)
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Başarılı giriş, ana ekrana yönlendir
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Hata durumunu göster
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Giriş başarısız. Lütfen bilgileri kontrol et.'),
          ),
        );
      }
    } catch (e) {
      print("Bağlantı hatası: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YetişApp Giriş')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-posta'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: _login, child: Text('Giriş Yap')),
          ],
        ),
      ),
    );
  }
}
