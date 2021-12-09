import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_control_c/controller/card_controller.dart';
import 'package:shope_control_c/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print('run scf');
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<ShoppingController>(
                builder: (controller) {
                  print('hello ====>');
                  return Obx(
                    () {
                      print('obx');
                      if (controller.products.isNotEmpty) {
                        return Stack(
                          children: [
                            ListView.builder(
                              itemCount: controller.products.length +
                                  (controller.allLoaded.value ? 1 : 0),
                              controller: controller.scrollController,
                              itemBuilder: (context, index) {
                                print(
                                    'list view product => ${controller.products.length}');
                                if (index < controller.products.length) {
                                  return Card(
                                    margin: const EdgeInsets.all(12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.products[index].productName}',
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                  Text(
                                                      '${controller.products[index].productDescription}'),
                                                ],
                                              ),
                                              Text(
                                                  '\$${controller.products[index].price}',
                                                  style:
                                                      TextStyle(fontSize: 24)),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'index $index',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              cartController.addToCard(
                                                  controller.products[index]);
                                            },
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Text('Add to Cart'),
                                          ),
                                          Obx(
                                            () => IconButton(
                                              icon: controller.products[index]
                                                      .isFavorite.value
                                                  ? Icon(
                                                      Icons.check_box_rounded)
                                                  : Icon(Icons
                                                      .check_box_outline_blank_outlined),
                                              onPressed: () {
                                                controller
                                                    .products[index].isFavorite
                                                    .toggle();

                                                // controller.products[index].isFavorite.value = !controller.products[index].isFavorite.value;
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: Get.width,
                                    height: 50,
                                    child: Center(
                                      child: Text('Nothing more to Load'),
                                    ),
                                  );
                                }
                              },
                            ),
                            if (controller.loading.value) ...[
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: Container(
                                  width: Get.width,
                                  height: 80,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              )
                            ]
                          ],
                        );
                      } else {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(
              builder: (controller) => Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(
          builder: (controller) => Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
