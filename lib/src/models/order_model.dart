import 'package:henrys/src/models/basket_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDatetime;
  DateTime overdueDatetime;
  List<BasketItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdDatetime,
    required this.overdueDatetime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}