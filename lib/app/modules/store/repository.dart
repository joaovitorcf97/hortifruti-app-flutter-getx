import 'package:hortifrutti_app/app/data/models/store.dart';

import '../../data/providers/api.dart';

class StoreRepository {
  final Api _api;

  StoreRepository(this._api);

  Future<StoreModel> getStore(int id) => _api.getStore(id);
}
