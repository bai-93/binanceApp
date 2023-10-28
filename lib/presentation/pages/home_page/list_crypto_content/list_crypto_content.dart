import 'package:flutter/material.dart';

class CryptoListContent extends StatelessWidget {
  const CryptoListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return contentList(index);
        });
  }

  Widget contentList(int index) {
    return ListTile(
      splashColor: Colors.transparent,
      tileColor: Colors.white,
      leading: Container(color: Colors.yellow, height: 50.0, width: 50.0),
      title: const Text(
        'Bitcoin',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      subtitle: const Text('BTC'),
      trailing: const Text(
        '34 308,7 \$',
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
      onTap: () {
        debugPrint('tapped list tile and index === ${index}');
      },
    );
  }
}
