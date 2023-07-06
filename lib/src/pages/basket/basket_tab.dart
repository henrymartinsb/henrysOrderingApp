import 'package:flutter/material.dart';
import 'package:henrys/src/config/app_data.dart' as app_data;
import 'package:henrys/src/pages/basket/components/basket_tile.dart';
import 'package:henrys/src/services/utils_services.dart';
import '../../commom_widgets/payment_dialog.dart';
import '../../models/basket_item_model.dart';

class BasketTab extends StatefulWidget {
  const BasketTab({super.key});

  @override
  State<BasketTab> createState() => _BasketTabState();
}

class _BasketTabState extends State<BasketTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromBasket(BasketItemModel basketItem) {
    setState(() {
      app_data.basketItems.remove(basketItem);
    });
  }

  double basketTotalPrice() {
    double total = 0;

    for (var item in app_data.basketItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cesta'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: app_data.basketItems.length,
              itemBuilder: (_, index) {
                return BasketTile(
                  basketItem: app_data.basketItems[index],
                  remove: removeItemFromBasket,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total geral',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(basketTotalPrice()),
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      if (result ?? false) {
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: app_data.orders.first,
                            );
                        });
                      }
                    },
                    child: const Text(
                      'Concluir pedido',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Confirmação'),
          content: const Text('Você deseja confirmar o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'Não',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Sim',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
