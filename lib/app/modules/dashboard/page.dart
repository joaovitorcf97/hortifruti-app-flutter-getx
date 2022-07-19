import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DashboardPage')),
      body: Obx(
        () => IndexedStack(
          index: controller.currentPageIndex.value,
          children: const [
            Text('Incio'),
            Text('Pefil'),
            Text('Pedidos'),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: controller.changePageIndex,
          selectedIndex: controller.currentPageIndex.value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: 'Inicio',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list_outlined),
              selectedIcon: Icon(Icons.view_list),
              label: 'Pedidos',
            ),
          ],
        ),
      ),
    );
  }
}
