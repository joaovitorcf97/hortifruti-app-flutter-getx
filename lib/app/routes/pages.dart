import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/dashboard/binding.dart';
import 'package:hortifrutti_app/app/modules/dashboard/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
