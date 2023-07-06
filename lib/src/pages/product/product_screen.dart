import 'package:flutter/material.dart';
import 'package:henrys/src/commom_widgets/quantity_widget.dart';
import 'package:henrys/src/models/item_model.dart';
import 'package:henrys/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          children: [
            // Conteúdo
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: widget.item.imgUrl,
                    child: Image.network(widget.item.imgUrl),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Nome - Quantidade
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.item.itemName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            QuantityWidget(
                              value: cartItemQuantity,
                              suffixText: widget.item.unit,
                              result: (quantity) {
                                setState(() {
                                  cartItemQuantity = quantity;
                                });
                              },
                            ),
                          ],
                        ),

                        // Preço
                        Text(
                          utilsServices.priceToCurrency(widget.item.price),
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),

                        // Descrição
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SingleChildScrollView(
                              child: Text(
                                widget.item.description,
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Botão
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.deepPurpleAccent,
                            ),
                            label: const Text(
                              'Adicionar a cesta',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            icon: const Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
