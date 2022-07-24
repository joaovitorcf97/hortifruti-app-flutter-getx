import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityAndWeighWidget extends StatelessWidget {
  final bool isKG;

  const QuantityAndWeighWidget({
    Key? key,
    this.isKG = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKG: isKG),
      builder: ((controller) {
        return Column(
          children: [
            QuantityWidget(),
          ],
        );
      }),
    );
  }
}

class QuantityWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity - 1),
          child: Icon(Icons.remove),
        ),
        Text('$quantity'),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

class QuantityAndWeightController extends GetxController {
  final bool isKG;

  QuantityAndWeightController({required this.isKG});

  num quantity = 1;

  void changeQuantity(num value) {
    quantity = value;

    update();
  }
}
