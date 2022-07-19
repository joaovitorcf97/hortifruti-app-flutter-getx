import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreStatus extends StatelessWidget {
  final bool isOnline;

  const StoreStatus({Key? key, required this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Chip(
        avatar: const Icon(
          Icons.check,
          color: Colors.white,
          size: 18,
        ),
        label: Text(
          isOnline ? 'Aberto' : 'Fechado',
          style: Get.textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
        backgroundColor: isOnline ? Colors.green : Colors.black45,
      ),
    );
  }
}
