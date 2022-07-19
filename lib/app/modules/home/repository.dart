import 'package:hortifrutti_app/app/data/models/store.dart';

import '../../data/providers/api.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<StoreModel>> getStores() => _api.getStores();
}
