import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_test/pages/products/product_page_controller.dart';

class ProductList extends GetView<ProductPageController> {
  final void Function()? onTap;
  const ProductList({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, int index) {
        final product = controller.products[index];
        return ListTile(
          dense: false,
          leading: CircleAvatar(
            backgroundImage: AssetImage(product.photoUrl),
          ),
          title: Text(product.title),
          subtitle: Text(
            product.description,
            maxLines: 2,
          ),
          trailing: Text('${product.price} руб'),
          onTap: () {
            controller.selectedProduct = product;
            onTap!();
          },
          isThreeLine: false,
        );
      },
      separatorBuilder: (context, int index) {
        return const Divider();
      },
      itemCount: controller.products.length,
    );
  }
}
