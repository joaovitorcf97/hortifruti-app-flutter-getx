import 'package:get/get.dart';
import 'package:hortifrutti_app/app/data/models/store.dart';

import 'repository.dart';

class StoreController extends GetxController with StateMixin<StoreModel> {
  final StoreRepository _repository;
  StoreController(this._repository);

  @override
  void onInit() {
    int id = int.parse(Get.parameters['id']!);

    _repository.getStore(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}
