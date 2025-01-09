import 'package:flutter/material.dart';
import '../../controllers/proteinium_provider.dart';

Widget buildBottomNavigationBar(ProteiniumProvider provider) {
  return BottomNavigationBar(
    elevation: 4,
    currentIndex: provider.selectedIndex,
    onTap: provider.setSelectedIndex,
    selectedItemColor: Colors.teal.shade300,
    unselectedItemColor: Colors.grey,
    unselectedLabelStyle: TextStyle(color: Colors.grey),
    type: BottomNavigationBarType.fixed, // Ensure labels are always visible
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.fastfood),
        label: 'Meals',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz),
        label: 'More',
      ),
    ],
  );
}
