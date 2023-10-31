import 'package:intl/intl.dart';

mixin Utils {
  String formatCurrencyEx(num price, {String symbol = 'đ'}) {
    final vietNamFormatCurrency =
        NumberFormat.currency(locale: 'vi-VN', symbol: symbol);
    return vietNamFormatCurrency
        .format(price)
        .replaceAll('.', ',')
        .replaceAll(RegExp(r'\s+'), '');
  }
}
