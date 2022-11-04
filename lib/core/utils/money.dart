import 'dart:io';

import 'package:intl/intl.dart';

final String defaultLocale = Platform.localeName;
final oCcy = NumberFormat.compactSimpleCurrency(locale: defaultLocale);

String formatCurrency(double amount) {
  return oCcy.format(amount);
}
