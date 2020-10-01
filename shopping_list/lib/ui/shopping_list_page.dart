import 'package:flutter/material.dart';
import 'package:shopping_list/http/item_service.dart';
import 'package:shopping_list/model/item.dart';
import 'package:shopping_list/ui/dialog/item_dialog.dart';
import 'package:shopping_list/ui/shopping_list_item_page.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final _scaffoldState = GlobalKey<ScaffoldState>();
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
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
        key: _scaffoldState,
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String itemName = await showDialog(
              context: context,
              builder: (BuildContext context) => ItemDialog(),
            );
            if (itemName.isNotEmpty) {
              var item =
                  Item(name: itemName, isCompleted: false, isArchived: false);
              try {
                await _itemService.addItem(item);
                setState(() {});
              } catch (e) {
                _scaffoldState.currentState
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            }
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
