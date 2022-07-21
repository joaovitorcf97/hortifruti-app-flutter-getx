import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/dashboard/binding.dart';
import 'package:hortifrutti_app/app/modules/dashboard/page.dart';
import 'package:hortifrutti_app/app/modules/product/binding.dart';
import 'package:hortifrutti_app/app/modules/product/page.dart';
import 'package:hortifrutti_app/app/modules/store/binding.dart';
import 'package:hortifrutti_app/app/modules/store/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.store,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
  ];
}
