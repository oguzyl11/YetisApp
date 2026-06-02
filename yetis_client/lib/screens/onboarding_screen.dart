import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key?关键}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Tanıtım sayfalarının içerikleri (Tasarım klasöründeki konseptlere uygun olarak)
  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Ekonomik ve Taze",
      "description": "Kafeterya, market ve restoranlardaki taze ürünleri çok daha uygun fiyatlara yakala.",
    },
    {
      "title": "Dünyayı Kurtar",
      "description": "Gıda israfının önüne geçerek hem bütçeni koru hem de çevreye katkıda bulun.",
    },
    {
      "title": "Yetiş ve Al!",
      "description": "Sana en yakın dükkanlardaki fırsat ilanlarına hızlıca yetiş, tükenmeden teslim al.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Üst Kısım: Geç butonu
            Alignment(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Doğrudan karşılama/giriş ekranına yönlendir
                  Navigator.pushReplacementNamed(context, '/welcome');
                },
                child: const Text(
                  'Geç',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            
            // Orta Kısım: Kaydırılabilir Sayfalar
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Görsel Alanı (İleride buraya SVG veya Asset Image eklenebilir)
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          index == 0 
                              ? Icons.eco 
                              : index == 1 
                                  ? Icons.減災 // Her sayfa için farklı bir sembolik ikon
                                  : Icons.shopping_bag,
                          size: 100,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        _onboardingData[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _onboardingData[index]["description"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Alt Kısım: Sayfa Noktaları ve Buton
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Sayfa İndikatör Noktaları
                  Row(
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 8),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index ? Colors.green : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  
                  // İlerleme veya Başlama Butonu
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingData.length - 1) {
                        // Son sayfadaysa Kayıt/Giriş ekranına geç
                        Navigator.pushReplacementNamed(context, '/welcome');
                      } else {
                        // Değilse bir sonraki sayfaya kaydır
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      _currentPage == _onboardingData.length - 1 ? 'Başla' : 'İleri',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}