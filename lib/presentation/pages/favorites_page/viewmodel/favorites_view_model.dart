import 'package:sheker/domain/entities/favorites_hive.dart';
import 'package:sheker/domain/entities/hive_services/favorites_service_hive.dart';

class FavoritesViewModel {
  int itemCount() {
    return FavoritesServiceHive.favoritesDataBase?.length ?? 0;
  }

  List<FavoritesHive> getItems() {
    return FavoritesServiceHive.favoritesDataBase?.values.toList() ?? [];
  }

  Future<void> reorderData(int oldIndex, int newIndex) async {
    final oldData = FavoritesServiceHive.getDataByIndex(oldIndex);
    final newData = FavoritesServiceHive.getDataByIndex(newIndex);
    if (oldData != null && newData != null) {
      FavoritesServiceHive.favoritesDataBase?.putAt(oldIndex, FavoritesHive());
      FavoritesServiceHive.favoritesDataBase?.putAt(newIndex, FavoritesHive());
      await FavoritesServiceHive.favoritesDataBase?.putAt(oldIndex, newData);
      await FavoritesServiceHive.favoritesDataBase?.putAt(newIndex, oldData);
    }
  }

  void removeDataOnIndex(int index) {
    FavoritesServiceHive.removeData(index);
  }
}
