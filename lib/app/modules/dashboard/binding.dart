import 'package:get/get.dart';
import 'package:hortifrutti_app/app/data/providers/api.dart';
import 'package:hortifrutti_app/app/modules/home/controller.dart';
import 'package:hortifrutti_app/app/modules/home/repository.dart';

import 'controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(
      () => HomeController(HomeRepository(Get.find<Api>())),
    );
  }
}
