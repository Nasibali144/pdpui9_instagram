import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9_instagram/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        title: Text('Instagram', style: TextStyle(color: Colors.grey[400]),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Feather.camera, color: Colors.grey[400],),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Feather.tv, color: Colors.grey[400],),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesome.send_o, color: Colors.grey[400],),
            onPressed: (){},
          )
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.grey[900],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            title: Text('Upload'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            title: Text('Likes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
