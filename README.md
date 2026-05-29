# Yetiş — Proje Özeti & Tasarım Kılavuzu

## 1. Proje Kimliği

| Alan | Bilgi |
|------|-------|
| **Uygulama Adı** | Yetiş |
| **Slogan** | "Gün bitmeden yetiş, hem kazan hem kurtar" |
| **Pazar** | Türkiye |
| **Model** | Too Good To Go klonu, Türkiye'ye uyarlanmış |
| **Hedef Kitle** | 18–45 yaş, şehirde yaşayan, ekonomik + çevreci tüketici |
| **Platform** | iOS + Android (Flutter) |

---

## 2. Problem & Çözüm

**Problem:** Türkiye'de her yıl 26 milyon ton gıda israf ediliyor. Fırınlar, restoranlar ve kafeler gün sonunda satamadıkları ürünleri çöpe atmak zorunda kalıyor.

**Çözüm:** Yetiş, bu işletmelerin artık ürünlerini %50–70 indirimle son tüketiciye ulaştıran bir pazar yeri. Hem dükkan kazanıyor, hem müşteri tasarruf ediyor, hem de gıda israfı azalıyor.

---

## 3. Kullanıcı Yolculukları

### Müşteri
1. Uygulamayı aç → konumuna göre dükkanları gör
2. Dükkanı seç → ürünleri incele → sepete ekle
3. **Gel-Al** seçtiyse → ödeme → QR kod → dükkata tarar → teslim
4. **Kurye** seçtiyse → ödeme → kurye atanır → canlı takip → kapıda teslim
5. Değerlendirme bırak

### Dükkan
1. Kayıt ol → onay süreci (1–2 iş günü)
2. Her gün gün sonuna yakın ürünlerini ekle (stok, fiyat, son saat)
3. Sipariş bildirimi al → onayla
4. Gel-Al için QR kod tarat → kapat
5. Günlük / aylık kazanç raporunu gör

### Kurye
1. Uygulamayı aç → müsaitim → teslimat tekliflerini al
2. Teklifi kabul et → dükkan adresine git → paket teslim al
3. Müşteri adresine git → teslim et (fotoğraf / kod)
4. Puan kazan → haftalık ödeme

---

## 4. Ekranlar ve Akış (Özet)

```
SPLASH
  └─ ONBOARDING (3 slayt)
       └─ KAYIT / GİRİŞ
            ├─ TELEFON DOĞRULAMA (OTP)
            └─ ANA EKRAN
                 ├─ Dükkan Listesi (yakınlık, kategori, süre)
                 ├─ Harita Görünümü
                 ├─ DÜKKAN SAYFASI
                 │    ├─ Ürün Listesi
                 │    ├─ SEPET
                 │    │    ├─ Gel-Al Akışı → ÖdemeQR KodTeslim
                 │    │    └─ Kurye Akışı → ÖdemeKurye AtamaCANLI TAKİPTeslim
                 │    └─ Değerlendirme
                 ├─ SİPARİŞLERİM
                 └─ PROFİL
```

---

## 5. Tasarım Sistemi

### Renk Paleti
| Renk | Hex | Kullanım |
|------|-----|----------|
| Ana Yeşil | `#0F6E56` | Marka, header, buton |
| Açık Yeşil | `#1D9E75` | Gel-Al etiketi, vurgu |
| Arka Plan Yeşil | `#E1F5EE` | Kart tonlaması (fırın) |
| Turuncu | `#BA7517` | Kurye, aktif durum |
| Arka Plan Turuncu | `#FAEEDA` | Kart tonlaması (yemek) |
| Mavi | `#185FA5` | Bilgi, link |
| Arka Plan Mavi | `#E6F1FB` | Kart tonlaması (restoran) |
| Koyu Metin | `#1A1A1A` | Başlık, gövde |
| Açık Metin | `#6B6B6B` | İkincil bilgi |

### Tipografi
| Kullanım | Font | Boyut | Ağırlık |
|----------|------|-------|---------|
| Ekran Başlığı | Inter | 20px | 700 |
| Dükkan Adı | Inter | 14px | 600 |
| Gövde Metin | Inter | 13px | 400 |
| Fiyat | Inter | 14px | 700 (Ana Yeşil) |
| Etiket / Badge | Inter | 11px | 500 |

### Bileşenler
- **Dükkan Kartı:** Beyaz kart, 10px köşe, sol taraf renkli ürün görseli
- **Ürün Kartı:** İki sütun layout, eski fiyat üstü çizili
- **CTA Butonu:** Tam genişlik, 48px yükseklik, 24px köşe, Ana Yeşil
- **Badge:** Gel-Al (yeşil), Kurye (turuncu), iki seçenekli (mavi)
- **Durum Çubuğu:** Dikey timeline, tamamlanan adımlar dolu, aktif turuncu
- **QR Alan:** Tam ekran, büyük QR, süre sayacı

---

## 6. Teknik Mimari

```
[Flutter Mobil App]
       │
       │ HTTPS / WSS
       ▼
[Node.js + Express API]
       │
   ┌───┴────┐
   │        │
[PostgreSQL] [Redis Cache]
             │
         [Firebase FCM]   ← Push bildirimler
         [Socket.io]      ← Canlı konum / sipariş durumu
         [iyzico]         ← Ödeme
         [Google Maps]    ← Harita
         [AWS S3]         ← Fotoğraf depolama
```

---

## 7. MVP Kapsam (v1.0)

### Dahil ✅
- Müşteri kayıt / giriş (telefon + OTP)
- Konuma göre dükkan listeleme
- Ürün listeleme ve sepet
- Gel-Al akışı + QR kod doğrulama
- Kurye akışı + canlı konum takibi
- iyzico ödeme entegrasyonu
- Dükkan kayıt ve ürün yönetimi paneli
- Kurye kayıt ve teslimat akışı
- Push bildirimler (FCM)
- Temel puanlama sistemi

### Sonraki Sürüm ⏳
- Sürpriz paket (mystery box) özelliği
- Abonelik / premium dükkan listesi
- Gelişmiş filtreler (beslenme tercihi, alerjen)
- Referans sistemi
- Dükkan istatistik dashboard
- Web admin paneli

---

## 8. Geliştirme Takvimi (Önerilen)

| Hafta | Görev |
|-------|-------|
| 1–2 | Backend kurulum, DB şema, auth servisi |
| 3–4 | Dükkan ve ürün CRUD API'leri |
| 5–6 | Sipariş servisi, ödeme entegrasyonu |
| 7–8 | Flutter: auth, ana ekran, dükkan sayfası |
| 9–10 | Flutter: sepet, ödeme akışı, QR |
| 11–12 | Flutter: kurye modülü, canlı takip |
| 13–14 | Dükkan paneli (ayrı Flutter modülü) |
| 15–16 | Test, hata düzeltme, deploy hazırlığı |
| 17–18 | Beta test, geri bildirim, iyileştirmeler |
| 19–20 | App Store / Google Play yayını |

---

## 9. Deployment

### Backend
- **Sunucu:** AWS EC2 (t3.medium başlangıç) veya Railway
- **Veritabanı:** AWS RDS PostgreSQL veya Supabase
- **CDN:** CloudFront (görseller)
- **SSL:** Let's Encrypt
- **CI/CD:** GitHub Actions

### Mobil
- **Android:** Google Play Store
- **iOS:** App Store (Apple Developer hesabı gerekli)
- **OTA Güncelleme:** Shorebird (Flutter için)

---

## 10. Lisans & Telif

Bu proje MIT lisansı altında geliştirilmiştir.  
Tasarım referansı: Too Good To Go (konsept ilham)  
Tüm kod ve tasarım orijinal olarak Türkiye pazarı için oluşturulmuştur.
