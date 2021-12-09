import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:shope_control_c/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;
  final loading = false.obs;
  final allLoaded = false.obs;
  final newData = <Product>[].obs;

  final ScrollController scrollController = ScrollController();

  mockFetch() async {
    if (allLoaded.value) {
      return;
    }
    loading(true);
    await Future.delayed(Duration(microseconds: 500));
    newData.value =  products.length >= 60 ? [] : productResult;
    if(newData.isNotEmpty){
      products.addAll(newData);
    }
    loading(false);
    allLoaded(newData.isEmpty);
  }

  @override
  void onInit() {
    super.onInit();

    print('products data ==> $products');
    mockFetch();
    scrollController.addListener(() {
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent && !loading.value){
        print('New data call');
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

}

final productResult = <Product>[
  Product(1,
      price: 30,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'FirstProd'),
  Product(2,
      price: 40,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'SecProd'),
  Product(3,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(4,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(5,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(6,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(7,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(8,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(9,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(10,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(11,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(12,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(13,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(14,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(15,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(16,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(17,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(18,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(19,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(20,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
  Product(21,
      price: 49.5,
      productDescription: 'some description about product',
      productImage: 'abd',
      productName: 'ThirdProd'),
];
