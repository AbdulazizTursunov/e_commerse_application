import 'package:flutter/material.dart';

import 'all_product_page/product_page.dart';
import 'backet_page/basket_page.dart';
import 'favorites_page/favorites_page.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentTabIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const ProductsPage());
    screens.add(const FavoritesPage());
    screens.add(const BasketPage());
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: currentTabIndex, children: screens),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.teal,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'basket',
              ),
            ],
            currentIndex: currentTabIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
