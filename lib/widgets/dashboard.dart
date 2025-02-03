import 'package:flutter/material.dart';

import '../const.dart';
import '../pages/page.dart' as p;

class ECommerce extends StatefulWidget {
  const ECommerce({super.key});

  @override
  State<ECommerce> createState() => _ECommerceState();
}

class _ECommerceState extends State<ECommerce> {
  int index = 0;
  final List<Widget> pages = [
    p.Page(),
    p.Page(),
    p.Page(),
    p.Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(global[index]),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: ListTile(
                  title: Text("عمر إسماعيل العمري"),
                  subtitle: Text("عميل"),
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              for (var page = 0; page < pages.length; page++)
                ListTile(
                  title: Text(global[page]),
                  onTap: () {
                    setState(() {
                      index = page;
                      Navigator.pop(context);
                    });
                  },
                  trailing: Icon(icons[page]),
                ),
              Spacer(),
              ListTile(
                title: const Text('الأعدادات'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('في المستقبل ان شاء الله'),
                    ),
                  );
                },
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: const Text('عنا'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('في المستقبل ان شاء الله'),
                    ),
                  );
                },
                trailing: Icon(Icons.info),
              ),
            ],
          ),
        ),
        body: pages[index],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Badge(
            label: Text(2.toString()),
            isLabelVisible: false,
            child: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
