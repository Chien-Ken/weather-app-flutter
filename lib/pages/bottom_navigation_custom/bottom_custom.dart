import 'package:flutter/material.dart';
import 'package:weather_app/pages/detail/detailScreen.dart';
import 'package:weather_app/pages/home/home_screen.dart';

class BottomCustom extends StatefulWidget {
  const BottomCustom({super.key});

  @override
  State<BottomCustom> createState() => _BottomCustomState();
}

class _BottomCustomState extends State<BottomCustom> {
  List<BottomNavigationBarItem> ListItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Details'),
  ];

  List<Widget> listScreen = [
    const HomeScreen(),
    const DetailScreen(),
  ];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listScreen[activePage],
      bottomNavigationBar: BottomNavigationBar(        
        backgroundColor: Colors.white12,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        elevation: 0,
        currentIndex: activePage,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: ListItem,
      ),
    );
  }
}
