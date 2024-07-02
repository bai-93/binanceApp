import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sheker/domain/entities/hive_services/user_service_hive.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_draggable_page/view_model/wallet_draggable_view_model.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_draggable_page/wallet_draggable_content/wallet_assets_content.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_draggable_page/wallet_draggable_content/wallet_transaction_content.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletDraggableMainPage extends StatefulWidget {
  final int index;
  const WalletDraggableMainPage(this.index, {super.key});

  @override
  State<WalletDraggableMainPage> createState() =>
      _WalletDraggableMainPageState();
}

class _WalletDraggableMainPageState extends State<WalletDraggableMainPage> {
  WalletDraggableViewModel model = WalletDraggableViewModel();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.24,
      minChildSize: 0.24,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return ClipRRect(
          clipBehavior: Clip.none,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0.0, -3.0),
                    blurRadius: 3.0,
                    color: AppColorsUtility.internalShadow)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 2.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.labelMedium?.color,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32.0,
                  height: 50.0,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.index == 0
                                ? 'Transactions History'
                                : 'My Assets',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const Spacer(),
                          makeButton(true),
                          const SizedBox(width: 8.0),
                          makeButton(false)
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        widget.index == 0
                            ? WalletTransactionContent(model.dateOfOperations, [
                                model.firstPartTransaction,
                                model.secondPartTransaction
                              ])
                            : WalletAssetsContent()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget makeButton(bool isSearch) {
    String image = isSearch ? 'search.png' : 'filter.png';
    bool isDark = UserServiceHive.getIsDarkTheme();
    return GestureDetector(
      onTap: () {
        debugPrint(isSearch ? 'search' : 'filter');
      },
      child: Image.asset(
        'lib/images/wallet/$image',
        width: 24.0,
        height: 24.0,
        color: isDark ? Colors.white : null,
      ),
    );
  }
}
