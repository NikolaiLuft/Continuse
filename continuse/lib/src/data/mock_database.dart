import 'dart:async';

import 'package:continuse_2/src/domain/product.dart';

import '../domain/user.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Simulierte Datenbank
  User currUser = User(
    uid: "1",
    email: "curr@email.com",
    userName: "currUser",
    password: "123",
    birthday: DateTime.now(),
    products: [],
  );

  List<Product> products = [
    Product(
      id: '1',
      sellerUid: '1',
      title: "Toller Tisch",
      description: "Wie neu",
      isSwap: true,
      isReserved: false,
      pictures: [],
    ),
    Product(
      id: '2',
      sellerUid: '1',
      title: "Kaputten Stuhl",
      description: "Wie neu",
      isSwap: true,
      isReserved: false,
      pictures: [],
    ),
    Product(
      id: '3',
      sellerUid: '1',
      title: "Runder Reifen",
      description: "Wie neu",
      isSwap: true,
      isReserved: false,
      pictures: [],
    ),
  ];

  @override
  Future<void> addProduct(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    products.add(product);
  }

  @override
  Future<void> deleteProduct(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    products.remove(product);
  }

  @override
  Future<List<Product>> getAllProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
