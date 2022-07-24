import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
            if (isKG) WeightWidget(),
          ],
        );
      }),
    );
  }
}

class QuantityWidget extends StatelessWidget {
  final controller = Get.find<QuantityAndWeightController>();

  QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    final isKG = controller.isKG;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: quantity > 1
              ? () => controller.changeQuantity(quantity - 1)
              : null,
          child: const Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            minimumSize: const Size(40, 40),
          ),
        ),
        Container(
          width: isKG ? 96 : 54,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              NumberFormat.decimalPattern().format(quantity) +
                  (isKG ? 'kg' : ''),
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            minimumSize: const Size(40, 40),
          ),
        ),
      ],
    );
  }
}

class WeightWidget extends StatelessWidget {
  final controller = Get.find<QuantityAndWeightController>();

  WeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${NumberFormat.decimalPattern().format(controller.min)}kg',
          style: Get.textTheme.overline,
        ),
        Expanded(
          child: Slider(
            divisions: 19,
            min: controller.min,
            max: controller.max,
            value: controller.weight,
            label: controller.label,
            onChanged: controller.changeWeight,
          ),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(controller.max)}kg',
          style: Get.textTheme.overline,
        ),
      ],
    );
  }
}

class QuantityAndWeightController extends GetxController {
  final bool isKG;

  QuantityAndWeightController({required this.isKG});

  num quantity = 1;
  double get weight => quantity.toDouble();
  late double min;
  late double max;

  String get label {
    String unit = 'kg';
    String pattern = '0.00';
    var number = weight;

    if (number < 1) {
      number *= 1000;
      unit = 'g';
      pattern = '';
    } else if (number % number.toInt() == 0) {
      pattern = '';
    }

    return NumberFormat(pattern).format(number) + unit;
  }

  @override
  void onInit() {
    _updateMinMax();
    super.onInit();
  }

  void changeQuantity(num value) {
    quantity = value;

    _updateMinMax();
    update();
  }

  void changeWeight(double value) {
    quantity = value;

    update();
  }

  _updateMinMax() {
    min = weight - 1 + .5;
    max = weight;

    if (min < 0) {
      min = .5;
      max = 1;
    }
  }
}
