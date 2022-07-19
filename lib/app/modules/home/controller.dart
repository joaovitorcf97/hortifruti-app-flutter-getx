import 'package:get/get.dart';
import 'package:hortifrutti_app/app/data/models/store.dart';
import 'package:hortifrutti_app/app/modules/home/repository.dart';

class HomeController extends GetxController with StateMixin<List<StoreModel>> {
  HomeRepository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    _repository.getStores().then((data) {
      if (data.isEmpty) {
        change([], status: RxStatus.empty());
      }
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}
