import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/domain/entities/hive_services/favorites_service_hive.dart';
import 'package:sheker/presentation/pages/favorites_page/favorites_content/favorites_content.dart';
import 'package:sheker/presentation/pages/favorites_page/viewmodel/favorites_view_model.dart';

class FavoritesMain extends BaseScreen {
  const FavoritesMain({super.key});

  @override
  State<FavoritesMain> createState() => _FavoritesMainState();
}

class _FavoritesMainState extends BaseScreenState<FavoritesMain>
    with BaseScreenMixin {
  FavoritesViewModel model = FavoritesViewModel();
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
            return SizedBox(
              height: 90.0 * model.getItems().length,
              width: sizeOfScreen().width,
              child: ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    key: ValueKey(index),
                    children: [
                      const SizedBox(
                        height: 7.0,
                      ),
                      FavoritesContent(
                        model.getItems()[index],
                        () {
                          model.removeDataOnIndex(index);
                        },
                      ),
                      const SizedBox(
                        height: 7.0,
                      )
                    ],
                  );
                },
                itemCount: model.itemCount(),
                onReorder: (oldIndex, newIndex) async {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  await model.reorderData(oldIndex, newIndex);
                  // setState(() {});
                },
                proxyDecorator: (child, index, animation) {
                  return Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: child,
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
