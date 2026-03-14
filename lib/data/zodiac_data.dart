class ZodiacSign {
  final String name, nameTR, emoji, element, dateRange, planet;
  const ZodiacSign({required this.name, required this.nameTR, required this.emoji, required this.element, required this.dateRange, required this.planet});
}

const List<ZodiacSign> zodiacSigns = [
  ZodiacSign(name: 'aries',       nameTR: 'Koç',     emoji: '♈', element: 'fire',  dateRange: '21 Mar - 19 Nis', planet: 'Mars'),
  ZodiacSign(name: 'taurus',      nameTR: 'Boğa',    emoji: '♉', element: 'earth', dateRange: '20 Nis - 20 May', planet: 'Venüs'),
  ZodiacSign(name: 'gemini',      nameTR: 'İkizler', emoji: '♊', element: 'air',   dateRange: '21 May - 20 Haz', planet: 'Merkür'),
  ZodiacSign(name: 'cancer',      nameTR: 'Yengeç',  emoji: '♋', element: 'water', dateRange: '21 Haz - 22 Tem', planet: 'Ay'),
  ZodiacSign(name: 'leo',         nameTR: 'Aslan',   emoji: '♌', element: 'fire',  dateRange: '23 Tem - 22 Ağu', planet: 'Güneş'),
  ZodiacSign(name: 'virgo',       nameTR: 'Başak',   emoji: '♍', element: 'earth', dateRange: '23 Ağu - 22 Eyl', planet: 'Merkür'),
  ZodiacSign(name: 'libra',       nameTR: 'Terazi',  emoji: '♎', element: 'air',   dateRange: '23 Eyl - 22 Eki', planet: 'Venüs'),
  ZodiacSign(name: 'scorpio',     nameTR: 'Akrep',   emoji: '♏', element: 'water', dateRange: '23 Eki - 21 Kas', planet: 'Plüton'),
  ZodiacSign(name: 'sagittarius', nameTR: 'Yay',     emoji: '♐', element: 'fire',  dateRange: '22 Kas - 21 Ara', planet: 'Jüpiter'),
  ZodiacSign(name: 'capricorn',   nameTR: 'Oğlak',   emoji: '♑', element: 'earth', dateRange: '22 Ara - 19 Oca', planet: 'Satürn'),
  ZodiacSign(name: 'aquarius',    nameTR: 'Kova',    emoji: '♒', element: 'air',   dateRange: '20 Oca - 18 Şub', planet: 'Uranüs'),
  ZodiacSign(name: 'pisces',      nameTR: 'Balık',   emoji: '♓', element: 'water', dateRange: '19 Şub - 20 Mar', planet: 'Neptün'),
];
