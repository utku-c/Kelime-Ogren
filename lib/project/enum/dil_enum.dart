import 'package:flutter/foundation.dart' show describeEnum;

enum DilSecenek { eng, tr, ar, ru, fr }

extension DilExtension on DilSecenek {
  String get name => describeEnum(this);
  String get displayTitle {
    switch (this) {
      case DilSecenek.eng:
        return 'İngilizce';
      case DilSecenek.tr:
        return 'Türkçe';
      case DilSecenek.ar:
        return 'Arapça';
      case DilSecenek.ru:
        return 'Rusça';
      case DilSecenek.fr:
        return 'Fransızca';
      default:
        return 'Türkçe';
    }
  }
}
