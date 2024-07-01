import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_draggable_page/view_model/wallet_draggable_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletTransactionContent extends StatefulWidget {
  final List<String> dateFinanceOperation;
  final List<List<FinanceOperationsInfo>> financeOperationsInfo;
  const WalletTransactionContent(
      this.dateFinanceOperation, this.financeOperationsInfo,
      {super.key});

  @override
  State<WalletTransactionContent> createState() =>
      _WalletTransactionContentState();
}

class _WalletTransactionContentState extends State<WalletTransactionContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.dateFinanceOperation.length,
      itemBuilder: (context, index) {
        return Column(
          children: [financeContentList(index)[index]],
        );
      },
    );
  }

// date content
  List<Widget> dateContent() {
    String image = 'lib/images/wallet/calendar.png';
    List<Widget> dataUI = [];
    for (var element in widget.dateFinanceOperation) {
      dataUI.add(SizedBox(
        height: 24.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: makeContainerLine(),
            ),
            const Spacer(),
            Image.asset(image, width: 24.0, height: 24.0),
            const SizedBox(
              width: 4.0,
            ),
            Text(element, style: Theme.of(context).textTheme.titleSmall),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: makeContainerLine(),
            ),
          ],
        ),
      ));
    }
    return dataUI;
  }

  Widget makeContainerLine() {
    return Container(
      color: AppColorsUtility.secondary,
      height: 1.0,
      width: MediaQuery.of(context).size.width * 0.3,
    );
  }

// finance content
  List<Widget> financeContentList(int index) {
    return [
      Column(
        children: [
          dateContent()[index],
          const SizedBox(height: 8.0),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8.0);
            },
            itemCount: widget.financeOperationsInfo[index].length,
            itemBuilder: (context, localIndex) {
              return makeContainer(
                  widget.financeOperationsInfo[index][localIndex]);
            },
          ),
        ],
      ),
      Column(
        children: [
          dateContent()[index],
          const SizedBox(height: 8.0),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8.0);
            },
            itemCount: widget.financeOperationsInfo[index].length,
            itemBuilder: (context, localIndex) {
              return makeContainer(
                  widget.financeOperationsInfo[index][localIndex]);
            },
          ),
        ],
      ),
    ];
  }

  Widget makeContainer(FinanceOperationsInfo input) {
    return SizedBox(
      height: 68.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Image.asset(input.imagePath, width: 40.0, height: 40.0),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Text(input.titleOfPayInfo,
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 4.0),
              Text(input.subtitlePayInfo,
                  style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 15.0),
            child: Text(input.moneyValue,
                style: input.colorOfMoneyValue != null
                    ? TextStyle(
                        color: AppColorsUtility.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400)
                    : Theme.of(context).textTheme.labelMedium),
          )
        ],
      ),
    );
  }
}
