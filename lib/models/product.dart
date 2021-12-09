import 'package:get/state_manager.dart';

//TODO tý đổi import thành get.dart xem đổi gì ko

class Product {
  final int id;
  final String? productName;
  final String? productImage;
  final String? productDescription;
  final double? price;

  Product(
    this.id, {
    this.productName,
    this.productImage,
    this.productDescription,
    this.price,
  });

  final isFavorite = false.obs;
}


