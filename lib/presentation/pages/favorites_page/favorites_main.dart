import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/domain/entities/hive_services/favorites_service_hive.dart';

class FavoritesMain extends BaseScreen {
  const FavoritesMain({super.key});

  @override
  State<FavoritesMain> createState() => _FavoritesMainState();
}

class _FavoritesMainState extends BaseScreenState<FavoritesMain>
    with BaseScreenMixin {
  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      title: Text('Favorites', style: Theme.of(context).textTheme.bodyLarge),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        IconButton(
            onPressed: () {
              debugPrint('filter tapped');
            },
            icon: Image.asset('lib/images/market/filter.png',
                width: 24.0, height: 24.0))
      ],
    );
  }

  @override
  Widget body() {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: FavoritesServiceHive.favoritesDataBase!.listenable(),
          builder: (context, value, child) {
            debugPrint('VALUE LISTENABLE IS woooooooooooooork');
            print(
                'count == ${value.values.toList().length}  list ${value.values.toList()}');
            return Center(
              child: Text(value.values.last.name),
            );
          },
        )
      ],
    );
  }
}
