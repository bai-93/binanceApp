import 'package:flutter/material.dart';
import 'package:sheker/utilities/shimmer_utility.dart';

class PortfolioShimmer extends StatelessWidget {
  const PortfolioShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: makeShimmer(
        Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            makeTitleRow(context),
            const SizedBox(
              height: 8.0,
            ),
            makePortfolioList(context)
          ],
        ),
        context
      ),
    );
  }

  Widget makeTitleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        makeTitleContainer(context),
        makeTitleContainer(context),
      ],
    );
  }

  Container makeTitleContainer(BuildContext context) {
    return Container(
      height: 18.0,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }

  Widget makePortfolioContainers(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 35.0,
          height: 68.0,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 4.0,
                    color: Colors.blueGrey.shade200,
                    offset: const Offset(0.0, 3.0))
              ],
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10.0)),
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  Widget makePortfolioList(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 5 * 68 + 50,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return makePortfolioContainers(context);
          }),
    );
  }
}
