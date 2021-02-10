import 'package:chating_ui/widget/category_selector.dart';
import 'package:chating_ui/widget/favorite_contacts.dart';
import 'package:chating_ui/widget/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 28,
            ),
            onPressed: () {}),
        title: Center(
          child: Text(
            'Chats',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
