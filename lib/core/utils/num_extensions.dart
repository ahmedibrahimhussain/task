import 'package:intl/intl.dart';

extension NumExtensions on num{

  String get formatPrice{
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}