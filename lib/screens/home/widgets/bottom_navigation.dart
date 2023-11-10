import 'package:flutter/material.dart';
import 'package:my_wallet/screens/home/screen_home.dart';

class BottomNAvigation extends StatelessWidget {
  const BottomNAvigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndex,
      builder: (BuildContext ctx, int updatedIndex, Widget?_){
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        currentIndex: updatedIndex,
        onTap: (newIndex) {
          ScreenHome.selectedIndex.value=newIndex;
        },
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.category),
        label: 'Catogery',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.insights),
        label: 'Insights',
        ),
      ],
      );
      }
    );
  }
}