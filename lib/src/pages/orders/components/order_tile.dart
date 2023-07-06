import 'package:flutter/material.dart';
import 'package:henrys/src/commom_widgets/payment_dialog.dart';
import 'package:henrys/src/models/basket_item_model.dart';
import 'package:henrys/src/pages/orders/components/order_status_widget.dart';
import 'package:henrys/src/services/utils_services.dart';

import '../../../models/order_model.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDatetime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // informações do pedido
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    width: 10,
                  ),

                  // status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDatetime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),

            // Botão de pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(
                          order: order,
                        );
                      });
                },
                icon: Image.asset(
                  'lib/assets/app_images/pix.png',
                  height: 18,
                ),
                label: const Text(
                  'Ver QR Code Pix',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.utilsServices,
    required this.orderItem,
  });

  final UtilsServices utilsServices;
  final BasketItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(orderItem.item.itemName),
          ),
          Text(
            utilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
