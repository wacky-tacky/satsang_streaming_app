import 'package:flutter/material.dart';
import 'package:satsang_app/screens/home/profile.dart';
import 'package:satsang_app/screens/home/satsang.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Satsangs(),
    ProfileInfo()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:_widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 40.0),
        child: BottomNavigationBar(

          elevation: 0.0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                size: 40.0,),
                label: 'Home',

              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 40.0,),
                label: 'Profile',
              ),

            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,

            onTap: _onItemTapped
        ),
      )

    );
  }
}
