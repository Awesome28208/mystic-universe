# Mystic Universe — Flutter Projesi

## 📁 Dosya Yapısı

```
lib/
  main.dart                    → PageView swipe navigation + coin badge
  theme/
    app_colors.dart            → Element renk sistemi (Ateş/Toprak/Hava/Su) + AppTheme
  services/
    coin_service.dart          → SharedPreferences coin sistemi (ChangeNotifier)
  screens/
    horoscope_screen.dart      → 12 burç · Daily(10) / Weekly(20) / Compatibility(10) ⭐
    tarot_screen.dart          → 22 kart · 3 kart seç · Love/Career/Money/Health (20 ⭐)
    fortune_screen.dart        → Coffee reading (15⭐) + Numerology / Life Path (10⭐)
    games_screen.dart          → Gem Match · Crystal Garden · Mystic Solitaire · Word Spell
    daily_screen.dart          → 7 günlük streak · Coin shop · Watch ad (+50⭐)
```

## 🚀 Kurulum (Windows)

```bash
# 1. Flutter yoksa: flutter.dev'den indir, C:\flutter'a çıkar
# 2. PATH'e C:\flutter\bin ekle

# 3. Bağımlılıkları yükle
flutter pub get

# 4. Test et (emulator veya telefon bağlı olmalı)
flutter run

# 5. Release APK al
flutter build apk --release
# APK: build/app/outputs/flutter-apk/app-release.apk
```

## 🔑 Keystore Bilgileri (PDF'den)
```
Dosya:        keystore.jks
Şifre:        yourfortune123
Key alias:    yourfortune
Key şifresi:  yourfortune123
Package:      com.yourfortune.app
```
> ⚠️ Mevcut keystore.jks dosyasını `android/app/` klasörüne koy!

## 💰 Coin Sistemi
| Aksiyon          | Coin |
|-----------------|------|
| Başlangıç       | +1000 |
| Günlük ödül     | +100 |
| Reklam izle     | +50  |
| Daily horoscope | -10  |
| Weekly horoscope| -20  |
| Compatibility   | -10  |
| Tarot reading   | -20  |
| Coffee reading  | -15  |
| Numerology      | -10  |

## 📦 Bağımlılıklar (pubspec.yaml)
- `shared_preferences` → coin & streak kaydetme
- `provider` → state management
- `smooth_page_indicator` → swipe dot indicator
- `animated_text_kit` → animasyonlu yazılar
- `google_mobile_ads` → AdMob (gerçek reklamlar için)
- `lottie` → animasyon dosyaları

## 🔜 Sonraki Adımlar
1. `flutter pub get` çalıştır
2. `flutter doctor` — tüm yeşil olsun
3. Oyun ekranlarını implement et (`games_screen.dart` → Navigator.push)
4. AdMob App ID'yi `AndroidManifest.xml`'e ekle
5. Release APK al, Play Console'a yükle
