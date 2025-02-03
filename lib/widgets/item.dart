import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kolaib_market/const.dart';

class Item extends StatefulWidget {
  const Item({
    super.key,
    required this.image,
    required this.price,
    required this.discount,
    required this.name,
  });

  final String image, name;
  final num price, discount;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    final formatter2 = NumberFormat.compact();
    final saved = widget.price * widget.discount;
    final afterDiscount = widget.price - saved;
    return InkWell(
      onTap: () {
        debugPrint('do something');
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.black45),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Image.asset(
                    'assets/images/items/${widget.image}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.name),
                subtitle: Text(
                    'معدل البيع: ${formatter2.format(Random().nextInt(10000) + 10001)}'),
              ),
              Table(
                children: [
                  TableRow(
                    children: [
                      Text(
                        'السعر:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        afterDiscount.asCurrency(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'التكلفه:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.price.asCurrency(),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'الخصم:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${formatter2.format(widget.discount * 100)}%',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'وفرت:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        saved.asCurrency(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}