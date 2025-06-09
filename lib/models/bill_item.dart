import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'bill_item.g.dart';

@HiveType(typeId: 0)
class BillItem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double price;
  @HiveField(2)
  int quantity;
  @HiveField(3)
  double total;

  BillItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.total,
  });

  void updateTotal() {
    total = price * quantity;
  }
}
