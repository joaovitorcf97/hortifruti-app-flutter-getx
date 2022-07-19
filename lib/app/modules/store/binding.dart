import 'package:get/get.dart';
import 'package:hortifrutti_app/app/data/providers/api.dart';

import 'controller.dart';
import 'repository.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(StoreRepository(Get.find<Api>())),
    );
  }
}
