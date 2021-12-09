
import 'package:get/state_manager.dart';
import 'package:shope_control_c/models/product.dart';

class CartController extends GetxController{
  var cartItems = <Product>[].obs;

  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!);

  addToCard(Product? product){
    cartItems.add(product!);
  }

}