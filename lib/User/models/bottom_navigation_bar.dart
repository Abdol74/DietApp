import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomNavigationBar extends StatelessWidget {
  bottomNavigationBar(
      {@required this.backgroundcolor,
      @required this.selecteditemcolor,
      @required this.unselecteditemColor});

  final Color backgroundcolor;
  final Color selecteditemcolor;
  final Color unselecteditemColor;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundcolor,
      selectedItemColor: selecteditemcolor,
      unselectedItemColor: unselecteditemColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          title: Text('Favorites'),
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Places'),
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          title: Text('News'),
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}
