import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const global = ['الرئيسيه', 'الملابس', 'اكسسوارات', 'العاب'];
final icons = [Icons.home, Icons.dry_cleaning, Icons.diamond, Icons.toys];

extension NumberExtensions on num {
  String asCurrency({String? locale, bool compact = false}) {
    final nf = compact
        ? NumberFormat.compactCurrency
        : NumberFormat.currency;
    return nf(locale: locale ?? 'ar_YE').format(this);
  }
}
