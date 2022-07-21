import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import 'controller.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = controller.product.value!;
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.image.isNotEmpty)
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.image,
                    ),
                  ),
                ),
              ),
            if (product.description != null)
              Text(
                product.description!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
              NumberFormat.simpleCurrency().format(product.price) +
                  (product.isKG ? ' /KG' : ''),
              style: Get.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controller.observationController,
              decoration: const InputDecoration(
                label: Text('Observação'),
              ),
              maxLength: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () => controller.addToCart(),
                child: const Text('Adicionar no carrinho'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
