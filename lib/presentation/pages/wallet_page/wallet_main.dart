import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/wallet_page/viewmodel/wallet_view_model.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_card_page/wallet_card_main.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletMain extends BaseScreen {
  const WalletMain({super.key});

  @override
  State<WalletMain> createState() => _WalletMainState();
}

class _WalletMainState extends BaseScreenState<WalletMain>
    with BaseScreenMixin {
  WalletViewModel model = WalletViewModel();

  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      title: Text('Wallet', style: Theme.of(context).textTheme.bodyLarge),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        IconButton(
            onPressed: () {
              debugPrint('filter tapped');
            },
            icon: Image.asset('lib/images/wallet/scan.png',
                width: 24.0, height: 24.0))
      ],
    );
  }

  @override
  Widget body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: SizedBox(
            width: sizeOfScreen().width,
            height: 32.0,
            child: CupertinoSlidingSegmentedControl(
                children: model.makeSlidingItems(context),
                groupValue: model.getSlideIndex(),
                onValueChanged: (index) {
                  setState(() {
                    model.setSlideIndex(index ?? 0);
                  });
                }),
          ),
        ),
        const SizedBox(height: 16.0),
        model.getSlideIndex() == 0
            ? WalletCardsMainPage(model.getCardIndex(), (index) {
                model.setCardIndex(index);
              })
            : const Center(),
        const SizedBox(height: 16.0),
        makeFinanceOperationButtons(),
        const SizedBox(height: 16.0)
      ],
    );
  }

  Widget makeFinanceOperationButtons() {
    List<void Function()> actions = [
      model.depositTapped,
      model.sendTapped,
      model.receiveTapped,
      model.withdrawTapped
    ];

    List<Widget> dataWidget = [];

    for (int i = 0; i < actions.length; i++) {
      dataWidget.add(GestureDetector(
        onTap: () {
          actions[i]();
        },
        child: Column(
          children: [
            Image.asset(model.getImagePath()[i], width: 44.0, height: 44.0),
            Text(
              model.getFinanceButtonTitles()[i],
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsets.only(left: 23.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: dataWidget,
      ),
    );
  }
}
