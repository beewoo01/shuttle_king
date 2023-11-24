import 'package:easy_localization/easy_localization.dart';

extension FormatterNumberWithDot on int {
  String formatNumber() => NumberFormat('#,##0').format(this);
}