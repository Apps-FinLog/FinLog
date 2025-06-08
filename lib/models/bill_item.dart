import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'bill_item.g.dart';

@HiveType(typeId: 0)
class BillItem extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final int quantity;
  @HiveField(3)
  final double total;

  BillItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.total,
  });
}
