import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_test/pages/products/product_page_controller.dart';

class DetailsPage extends GetView<ProductPageController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.selectedProduct.title)),
      body: Column(
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              controller.selectedProduct.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
