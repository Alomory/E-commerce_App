import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kolaib_market/utils.dart';

import '../widgets/item.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  final controller = SearchController();
  late List<Item> temp;

  @override
  void initState() {
    temp = [
      for (var item = 1; item < 40; item++)
        Item(
          image: '${Random().nextInt(11) + 1}.jpg',
          price: Random().nextDouble() * 1000,
          discount: Random().nextDouble(),
          name: "سياره دهف $item",
        )
    ];
    super.initState();
  }

  search(v) {
    if (v.trim().isEmpty) {
      temp =[
            for (var item = 1; item < 40; item++)
              Item(
                image: '${Random().nextInt(11) + 1}.jpg',
                price: Random().nextDouble() * 1000,
                discount: Random().nextDouble(),
                name: "سياره دهف $item",
              )
          ];
      setState(() {});
      return;
    }
    final list = temp.where(
      (e) => e.name.toLowerCase().contains(v.toLowerCase()),
    );
    setState(() => temp = list.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(
            controller: controller,
            leading: IconButton(
              onPressed: () => search(controller.text),
              icon: Icon(Icons.search),
            ),
            onSubmitted: search,
            trailing: [
              if (controller.text.isNotEmpty)
                IconButton(
                  onPressed: () {
                    controller.clear();
                    search('');
                  },
                  icon: Icon(Icons.cancel),
                )
            ],
            onTapOutside: (event) => Utils.closeKeyboard(),
          ),
        ),
        if (temp.isEmpty)
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Text("لم يتم العثور على نتائج 🥲"),
              ),
            ),
          )
        else
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1 / 2),
              ),
              itemCount: temp.length,
              itemBuilder: (context, index) {
                return temp[index];
              },
            ),
          )
      ],
    );
  }
}
