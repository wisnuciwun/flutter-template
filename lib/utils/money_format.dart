import 'package:intl/intl.dart';

moneyFormat(int? number) {
  final formatter =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  return formatter.format(number);
}
