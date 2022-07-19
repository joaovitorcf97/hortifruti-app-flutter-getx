import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/widgets/store_status.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../routes/routes.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hortifruti')),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var store in state!)
              ListTile(
                title: Text(
                  store.name,
                  style: TextStyle(fontSize: 15),
                ),
                leading: SizedBox(
                  width: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: store.image,
                    ),
                  ),
                ),
                trailing: StoreStatus(isOnline: store.isOnline),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                onTap: () => Get.toNamed(
                  Routes.store.replaceFirst(
                    ':id',
                    store.id.toString(),
                  ),
                ),
              )
          ],
        ),
        onError: (error) => Center(
          child: Text(
            'Ocorreu algum erro, tente novamente mais tarde!',
            style: Get.textTheme.bodyMedium!.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        onEmpty: const Center(
          child: Text(
            'Nenhum estabelecimento encontrado',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
