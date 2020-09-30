import 'package:flutter/material.dart';
import 'package:shopping_list/ui/dialog/item_dialog.dart';
import 'package:shopping_list/ui/shopping_list_item_page.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    _pageController.addListener(() {
      int currentIndex = _pageController.page.round();
      if (currentIndex != _selectedIndex) {
        _selectedIndex = currentIndex;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String itemName = await showDialog(
              context: context,
              builder: (BuildContext context) => ItemDialog(),
            );
            print(itemName);
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: buildPageView());
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.list), title: Text("Shoppling List")),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text("History")),
      ],
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
        _pageController.jumpToPage(value);
      },
    );
  }

  PageView buildPageView() {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Container(
          color: Colors.purpleAccent,
        ),
        ShoppingListItemPage(),
        Container(
          color: Colors.yellowAccent,
        ),
      ],
    );
  }
}
