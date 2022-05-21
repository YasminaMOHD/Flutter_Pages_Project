import 'package:api_project/providers/my_provider.dart';
import 'package:api_project/ui/another_cart_page.dart';
import 'package:api_project/ui/another_favorite_page.dart';
import 'package:api_project/ui/another_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Example extends StatefulWidget {
  // static List<Widget> widgetOption = [HomePage(), Favorite(), Cart()];
  static List<Widget> widgetOption = [
    AnotherHome(),
    AnotherFavoritePage(),
    AnotherCartPage()
  ];

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int selectedIndex = 0;

  onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    Provider.of<MyProvider>(context, listen: false).getAllcartProduct;

    Provider.of<MyProvider>(context, listen: false).getAllfavoriteProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text('Favorite')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart), title: Text('Cart'))
          ]),
      body: Example.widgetOption.elementAt(selectedIndex),
    );
  }
}
