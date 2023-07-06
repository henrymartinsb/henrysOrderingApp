import 'package:flutter/material.dart';
import 'package:henrys/src/services/utils_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/order_model.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pagamento com Pix',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),

                // QR Code
                QrImageView(
                    data: "389nf98f9fn398nf389fn9wnf9w98f3n8f3nf9w9fn3f983w",
                    version: QrVersions.auto,
                    size: 200.0),

                // Vencimento
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDatetime)}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                // Total
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                // Botão copia e cola
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                    size: 15,
                  ),
                  label: const Text(
                    'Copiar código Pix',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
