import 'package:flutter/material.dart';
import 'package:henrys/src/models/item_model.dart';

class BasketItemModel {
  ItemModel item;
  int quantity;

  BasketItemModel({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}
