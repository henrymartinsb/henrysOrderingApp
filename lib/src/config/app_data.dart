import 'package:henrys/src/models/item_model.dart';
import 'package:henrys/src/models/order_model.dart';
import 'package:henrys/src/models/user_model.dart';

import '../models/basket_item_model.dart';

ItemModel heineken = ItemModel(
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  imgUrl:
      'lib/assets/products/heineken.png',
  itemName: 'Heineken',
  price: 6.90,
  unit: 'und',
);

ItemModel budweiser = ItemModel(
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  imgUrl:
      'lib/assets/products/budweiser.png',
  itemName: 'Budweiser',
  price: 5.40,
  unit: 'und',
);

ItemModel hoegaarden = ItemModel(
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  imgUrl:
      'lib/assets/products/hoegaarden.png',
  itemName: 'Hoegaarden',
  price: 8.50,
  unit: 'und',
);

ItemModel becks = ItemModel(
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  imgUrl:
      'lib/assets/products/becks.png',
  itemName: "Beck's",
  price: 5.90,
  unit: 'und',
);

ItemModel sol = ItemModel(
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  imgUrl:
      'lib/assets/products/sol.png',
  itemName: 'Sol',
  price: 5.90,
  unit: 'und',
);

ItemModel stelaArtois = ItemModel(
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  imgUrl:
      'lib/assets/products/sol.png',
  itemName: 'Stela Artois',
  price: 7.90,
  unit: 'und',
);

List<ItemModel> items = [
  heineken,
  budweiser,
  hoegaarden,
  becks,
  sol,
  stelaArtois,
];

List<String> categories = [
  'Bebidas',
  'Carnes',
  'Italiana',
  'Lanches',
  'Mercado',
  'Açaí',
  'Farmácia',
  'Salgados',
  'Cafés',
  'Saudável',
  'Japonesa',
  'Árabe',
  'Brasileira',
  'Cervejas',
  'Refrigerantes',
  'Doces',
  'Padaria',
  'Confeitaria',
  'Sorvetes',
  'Vegetariana',
  'Frutos do Mar',
  'Variados'
];

List<BasketItemModel> basketItems = [
  BasketItemModel(
    item: heineken,
    quantity: 6,
  ),
  BasketItemModel(
    item: hoegaarden,
    quantity: 12,
  ),
  BasketItemModel(
    item: sol,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  name: 'Henry Martins',
  email: 'henry@spacedsoft.com',
  phone: '99 9 9999-9999',
  cpf: '999.999.999-00',
  password: '',
);

List<OrderModel> orders = [
  // Order 1
  OrderModel(
    id: '#75932',
    createdDatetime: DateTime.parse(
      '2024-07-05 17:10:35.457',
    ),
    overdueDatetime: DateTime.parse(
      '2024-07-05 17:15:35.457',
    ),
    items: [
      BasketItemModel(
        item: heineken,
        quantity: 6,
      ),
      BasketItemModel(
        item: hoegaarden,
        quantity: 12,
      ),
      BasketItemModel(
        item: sol,
        quantity: 1,
      ),
    ],
    status: 'pending_payment',
    copyAndPaste: 'q18d2hd82he8',
    total: 149.3,
  ),//

  // Order 2
  OrderModel(
    id: '#832586',
    createdDatetime: DateTime.parse(
      '2024-07-03 12:40:35.457',
    ),
    overdueDatetime: DateTime.parse(
      '2024-07-03 12:45:35.457',
    ),
    items: [
      BasketItemModel(
        item: hoegaarden,
        quantity: 12,
      ),
      BasketItemModel(
        item: sol,
        quantity: 5,
      ),
    ],
    status: 'preparing_purchase',
    copyAndPaste: 'q18d2hd82he8',
    total: 131.5,
  ),

  // Order 3
  OrderModel(
    id: '#93842',
    createdDatetime: DateTime.parse(
      '2024-07-03 12:40:35.457',
    ),
    overdueDatetime: DateTime.parse(
      '2024-07-03 12:45:35.457',
    ),
    items: [
      BasketItemModel(
        item: stelaArtois,
        quantity: 12,
      ),
      BasketItemModel(
        item: budweiser,
        quantity: 9,
      ),
    ],
    status: 'delivered',
    copyAndPaste: 'q18d2hd82he8',
    total: 143.4,
  ),

  // Order 4
  OrderModel(
    id: '#93842',
    createdDatetime: DateTime.parse(
      '2024-07-03 12:40:35.457',
    ),
    overdueDatetime: DateTime.parse(
      '2024-07-03 12:45:35.457',
    ),
    items: [
      BasketItemModel(
        item: stelaArtois,
        quantity: 12,
      ),
      BasketItemModel(
        item: budweiser,
        quantity: 9,
      ),
    ],
    status: 'refunded',
    copyAndPaste: 'q18d2hd82he8',
    total: 143.4,
  ),

  // Order 5
  OrderModel(
    id: '#93842',
    createdDatetime: DateTime.parse(
      '2024-07-03 12:40:35.457',
    ),
    overdueDatetime: DateTime.parse(
      '2024-07-03 12:45:35.457',
    ),
    items: [
      BasketItemModel(
        item: stelaArtois,
        quantity: 12,
      ),
      BasketItemModel(
        item: budweiser,
        quantity: 9,
      ),
    ],
    status: 'paid',
    copyAndPaste: 'q18d2hd82he8',
    total: 143.4,
  ),

  // Order 6
  OrderModel(
    id: '#93842',
    createdDatetime: DateTime.parse(
      '2024-07-03 12:40:35.457',
    ),
    overdueDatetime: DateTime.parse(
      '2024-07-03 12:45:35.457',
    ),
    items: [
      BasketItemModel(
        item: stelaArtois,
        quantity: 12,
      ),
      BasketItemModel(
        item: budweiser,
        quantity: 9,
      ),
    ],
    status: 'shipping',
    copyAndPaste: 'q18d2hd82he8',
    total: 143.4,
  ),

];


