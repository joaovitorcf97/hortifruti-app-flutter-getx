import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/data/models/product.dart';
import 'package:hortifrutti_app/app/data/models/store.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];

    super.onInit();
  }

  void addToCart() {
    observationController.text;
  }
}
