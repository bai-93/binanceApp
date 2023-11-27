import 'package:flutter/material.dart';

class FilterContentPersistentBar extends StatefulWidget {
  const FilterContentPersistentBar({super.key});

  @override
  State<FilterContentPersistentBar> createState() =>
      _FilterContentPersistentBarState();
}

class _FilterContentPersistentBarState
    extends State<FilterContentPersistentBar> {
  List<String> titleFilters = ['Hot', 'Капитализация', 'Цена', 'Изм за 24ч'];
  int indexOfFilter = 0;
  int indexOfList = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            children: [
              topContentFilter('Ваш список', 0),
              const SizedBox(
                width: 10.0,
              ),
              const SizedBox(height: 40.0),
              topContentFilter('Монета', 1)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: bottomContentFilter(),
        )
      ],
    );
  }

  Widget topContentFilter(String title, int index) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          indexOfList = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: indexOfList == index ? Colors.black : Colors.grey,
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget bottomContentFilter() {
    return SizedBox(
      height: 30.0,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexOfFilter = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: indexOfFilter == index
                        ? const Color.fromARGB(255, 234, 235, 238)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Center(
                    child: Text(
                      titleFilters[index],
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
