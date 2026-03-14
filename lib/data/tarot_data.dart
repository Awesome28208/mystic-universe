class TarotCard {
  final String name, nameTR, emoji, meaning, reversedMeaning;
  const TarotCard({required this.name, required this.nameTR, required this.emoji, required this.meaning, required this.reversedMeaning});
}

const List<TarotCard> majorArcana = [
  TarotCard(name: 'The Fool',         nameTR: 'Aptal',         emoji: '🃏', meaning: 'Yeni başlangıçlar, özgürlük, macera',       reversedMeaning: 'Sorumsuzluk, risk'),
  TarotCard(name: 'The Magician',     nameTR: 'Sihirbaz',      emoji: '🎩', meaning: 'Güç, beceri, irade',                         reversedMeaning: 'Manipülasyon, zayıf irade'),
  TarotCard(name: 'High Priestess',   nameTR: 'Yüksek Rahibe', emoji: '🌙', meaning: 'Sezgi, gizem, iç ses',                      reversedMeaning: 'Gizli gündem, yüzeysellik'),
  TarotCard(name: 'The Empress',      nameTR: 'İmparatoriçe',  emoji: '👑', meaning: 'Bereket, doğa, annelik',                    reversedMeaning: 'Bağımlılık, kısırlık'),
  TarotCard(name: 'The Emperor',      nameTR: 'İmparator',     emoji: '⚜️', meaning: 'Otorite, yapı, güvenlik',                    reversedMeaning: 'Katılık, kontrol'),
  TarotCard(name: 'The Hierophant',   nameTR: 'Başpapaz',      emoji: '✝️', meaning: 'Gelenek, inanç, rehberlik',                  reversedMeaning: 'Dogmatizm, isyan'),
  TarotCard(name: 'The Lovers',       nameTR: 'Aşıklar',       emoji: '💑', meaning: 'Aşk, birlik, değerler',                     reversedMeaning: 'Dengesizlik, ayrılık'),
  TarotCard(name: 'The Chariot',      nameTR: 'Savaş Arabası', emoji: '🏇', meaning: 'Kontrol, zafer, kararlılık',                 reversedMeaning: 'Kontrol kaybı, saldırganlık'),
  TarotCard(name: 'Strength',         nameTR: 'Güç',           emoji: '🦁', meaning: 'Cesaret, sabır, iç güç',                    reversedMeaning: 'Zayıflık, şüphe'),
  TarotCard(name: 'The Hermit',       nameTR: 'Münzevi',       emoji: '🏮', meaning: 'İçe dönüş, rehberlik, yalnızlık',           reversedMeaning: 'İzolasyon, yalnızlık'),
  TarotCard(name: 'Wheel of Fortune', nameTR: 'Kader Çarkı',   emoji: '☸️', meaning: 'Değişim, kader, şans',                     reversedMeaning: 'Kötü şans, döngü'),
  TarotCard(name: 'Justice',          nameTR: 'Adalet',        emoji: '⚖️', meaning: 'Adalet, denge, gerçek',                     reversedMeaning: 'Adaletsizlik, dengesizlik'),
  TarotCard(name: 'The Hanged Man',   nameTR: 'Asılan Adam',   emoji: '🙃', meaning: 'Bekleme, fedakarlık, yeni bakış açısı',     reversedMeaning: 'Gecikme, direnç'),
  TarotCard(name: 'Death',            nameTR: 'Ölüm',          emoji: '💀', meaning: 'Dönüşüm, son, yeni başlangıç',              reversedMeaning: 'Direnç, değişimden kaçış'),
  TarotCard(name: 'Temperance',       nameTR: 'Denge',         emoji: '⚗️', meaning: 'Denge, sabır, uyum',                        reversedMeaning: 'Dengesizlik, aşırılık'),
  TarotCard(name: 'The Devil',        nameTR: 'Şeytan',        emoji: '😈', meaning: 'Bağlılık, maddecilik, gölge benlik',        reversedMeaning: 'Özgürleşme, farkındalık'),
  TarotCard(name: 'The Tower',        nameTR: 'Kule',          emoji: '🏚️', meaning: 'Ani değişim, kaos, açıklama',               reversedMeaning: 'Kaçınma, gecikmiş felaket'),
  TarotCard(name: 'The Star',         nameTR: 'Yıldız',        emoji: '⭐', meaning: 'Umut, ilham, yenileme',                    reversedMeaning: 'Umutsuzluk, inanç kaybı'),
  TarotCard(name: 'The Moon',         nameTR: 'Ay',            emoji: '🌕', meaning: 'Yanılsama, korku, bilinçaltı',              reversedMeaning: 'Kafa karışıklığı, yalın gerçek'),
  TarotCard(name: 'The Sun',          nameTR: 'Güneş',         emoji: '☀️', meaning: 'Mutluluk, başarı, canlılık',                reversedMeaning: 'İyimserlik eksikliği'),
  TarotCard(name: 'Judgement',        nameTR: 'Yargı',         emoji: '📯', meaning: 'Yeniden doğuş, af, uyanış',                reversedMeaning: 'Öz şüphe, yargılanma korkusu'),
  TarotCard(name: 'The World',        nameTR: 'Dünya',         emoji: '🌍', meaning: 'Tamamlanma, bütünlük, başarı',              reversedMeaning: 'Eksik tamamlanma, kısa yol'),
];
