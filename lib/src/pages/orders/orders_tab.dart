import 'package:flutter/material.dart';
import 'package:henrys/src/config/app_data.dart' as app_data;
import 'package:henrys/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
        itemCount: app_data.orders.length,
      ),
    );
  }
}
