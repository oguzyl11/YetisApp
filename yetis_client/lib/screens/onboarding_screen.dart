import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Sayfalar arasında geçişi kontrol eden mekanizma
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Onboarding içerik listemiz
  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Gıda İsrafını Birlikte Önleyelim',
      'desc':
          'Restoran, fırın ve marketlerden kalan günlük taze ürünleri kurtararak doğaya ve bütçenize katkıda bulunun.',
      'image':
          'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?auto=format&fit=crop&q=80&w=400',
    },
    {
      'title': 'Ekonomik ve Taze',
      'desc':
          'En sevdiğiniz lokal dükkanlardan %70\'e varan indirimlerle hazırlanan taze kurtarma paketlerini sepetinize ekleyin.',
      'image':
          'https://images.unsplash.com/photo-1506084868230-bb9d95c24759?auto=format&fit=crop&q=80&w=400',
    },
    {
      'title': 'Dünyayı Kurtar',
      'desc':
          'Her siparişte bir öğünün çöpe gitmesini önle, karbon ayak izini azalt. Kahraman olmaya hazır mısın?',
      'image':
          'https://images.unsplash.com/photo-1448375240586-882707db888b?auto=format&fit=crop&q=80&w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Üst Kısım: Logo ve "Atla" Butonu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Yetiş',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF005440),
                      letterSpacing: -0.5,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Login ekranını kodladığımızda oraya yönlendireceğiz
                    },
                    child: const Text(
                      'Atla',
                      style: TextStyle(
                        color: Color(0xFF6B6B6B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // Orta Kısım: Kaydırılabilir Kartlar
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Yuvarlak Şık Görsel
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            _onboardingData[index]['image']!,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Başlık
                        Text(
                          _onboardingData[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF005440),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Açıklama
                        Text(
                          _onboardingData[index]['desc']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF3F4944),
                            height: 1.5,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Alt Kısım: Sayfa İndikatörü ve İlerleme Butonu
              Column(
                children: [
                  // Sayfa Noktaları (Indicators)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(right: 6),
                        height: 6,
                        width: _currentPage == index ? 20 : 6,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF005440)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Sonraki / Başla Butonu
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingData.length - 1) {
                        // Son sayfadaysak giriş/kayıt sayfasına gideceğiz
                      } else {
                        // Değilse sonraki sayfaya kaydır
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F6E56),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? 'Maceraya Başla!'
                          : 'Sonraki',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
