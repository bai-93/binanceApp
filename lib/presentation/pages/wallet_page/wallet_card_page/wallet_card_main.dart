import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_card_page/view_model/wallet_card_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletCardsMainPage extends StatefulWidget {
  final int cardIndex;
  final void Function(int) callbackIndexUpdate;
  const WalletCardsMainPage(this.cardIndex, this.callbackIndexUpdate,
      {super.key});

  @override
  State<WalletCardsMainPage> createState() => _WalletCardsMainPageState();
}

class _WalletCardsMainPageState extends State<WalletCardsMainPage> {
  WalletCardViewModel model = WalletCardViewModel();
  PageController controller = PageController();

  @override
  void initState() {
    controller = PageController(initialPage: widget.cardIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16.0),
            balanceMakeText(model.getTitleBalance()),
            balanceMakeText(
              model.getBalanceMoney(),
            ),
            const Spacer(),
            makeHideButton(),
            const SizedBox(
              width: 18.0,
            )
          ],
        ),
        const SizedBox(height: 16.0),
        cardContent()
      ],
    );
  }

  Widget cardContent() {
    return SizedBox(
      width: 349.0 * 3.0,
      height: 206.0,
      child: PageView.builder(
        controller: controller,
        clipBehavior: Clip.none,
        itemCount: 3,
        onPageChanged: (value) {
          widget.callbackIndexUpdate(value);
        },
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                height: 206.0,
                width: 325.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.0, -3.0),
                          color: model.gradientColos[index][0].withOpacity(0.5),
                          blurRadius: 3.0),
                      BoxShadow(
                          offset: const Offset(0.0, 3.0),
                          color: model.gradientColos[index][1].withOpacity(0.5),
                          blurRadius: 3.0),
                    ],
                    gradient: LinearGradient(
                      colors: model.gradientColos[index],
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 13.0,
                    ),
                    makeTopContentCard(model.cardModel[index]),
                    const SizedBox(height: 30.0),
                    makeCardNumberText(model.cardModel[index]),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10.0),
                      child: makeBottomContent(model.cardModel[index]),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  Text balanceMakeText(String input) {
    return Text(
      input,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }

  Widget makeHideButton() {
    return GestureDetector(
      onTap: () {
        debugPrint('on tap');
        setState(() {
          model.setIsSecuredFlag();
        });
      },
      child: SizedBox(
        height: 24.0,
        width: 24.0,
        child: Image.asset('lib/images/login/signup/view_light.png'),
      ),
    );
  }

  //CARD content
  Widget makeTopContentCard(CardInfoModel itemModel) {
    return itemModel.hasTitleTop
        ? Row(
            children: [
              const SizedBox(width: 16.0),
              Text(
                itemModel.mainTitleLefttTop,
                style: TextStyle(
                    color: itemModel.mainTitleColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 5.0),
              Container(
                  color: AppColorsUtility.secondary, width: 1.0, height: 25.0),
              const SizedBox(width: 5.0),
              Text(
                itemModel.minorTitleLefttTop,
                style: TextStyle(
                    color: AppColorsUtility.secondary,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        : Row(
            children: [
              const SizedBox(
                width: 16.0,
              ),
              Image.asset(itemModel.imageTopLeft, width: 100.0, height: 18.0),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: Image.asset(itemModel.imageTopRight,
                    width: 32.0, height: 32.0),
              )
            ],
          );
  }

  Widget makeCardNumberText(CardInfoModel cardInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 31.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cardInfo.cardDetailsNumber,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0,
                  color: cardInfo.mainTitleColor),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Text(
            cardInfo.expireTitleUnderCardDetailNumber,
            style: TextStyle(color: cardInfo.mainTitleColor),
          ),
        )
      ]),
    );
  }

  Widget makeBottomContent(CardInfoModel cardInfo) {
    return cardInfo.hasImageBottomRight
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(cardInfo.imageBottomRight, width: 80.0, height: 40.0),
            ],
          )
        : Row(
            children: [
              const SizedBox(width: 10.0),
              Column(
                children: [
                  Text(
                    cardInfo.cardHolderTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    cardInfo.cardHolderName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const Spacer(),
              Text(
                cardInfo.expireBottomRight,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 9.0)
            ],
          );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
