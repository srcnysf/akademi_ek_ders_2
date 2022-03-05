import 'package:intl/intl.dart';

extension PriceConverter on int {
  String toDecimals() {
    var formatter = NumberFormat('###,###,##0');
    var result = formatter.format(this);
    print(result);
    return "\$ $result";
  }
}
