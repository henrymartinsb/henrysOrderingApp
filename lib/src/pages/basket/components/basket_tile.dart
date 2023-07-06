import 'package:flutter/material.dart';
import 'package:henrys/src/commom_widgets/quantity_widget.dart';
import 'package:henrys/src/models/basket_item_model.dart';
import 'package:henrys/src/services/utils_services.dart';
import 'package:henrys/src/config/app_data.dart' as app_data;

class BasketTile extends StatefulWidget {
  final BasketItemModel basketItem;
  final Function(BasketItemModel) remove;

  const BasketTile({
    super.key,
    required this.basketItem,
    required this.remove,
  });

  @override
  State<BasketTile> createState() => _BasketTileState();
}

class _BasketTileState extends State<BasketTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        // imagem
        leading: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(
            widget.basketItem.item.imgUrl,
            height: 60,
            width: 60,
          ),
        ),
        // titulo
        title: Text(
          widget.basketItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.basketItem.totalPrice()),
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w500,
          ),
        ),

        // quantidade
        trailing: QuantityWidget(
            value: widget.basketItem.quantity,
            suffixText: widget.basketItem.item.unit,
            result: (quantity) {
              setState(() {
                widget.basketItem.quantity = quantity;

                if (quantity == 0) {
                  // Remove o item do carrinho
                  widget.remove(widget.basketItem);
                }
              });
            },
            isRemovable: true),
      ),
    );
  }
}
