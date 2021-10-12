import 'home_page.dart';
import 'my_barcode.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  
  List<Widget> _widgetOptions = <Widget>[    
    MyHomePage(),
    MyBarcode(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    }
    
     @override
  void initState() {
    // TODO: implement initState
         super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    int background=int.parse("0xff061041");
  int mycolor=int.parse("0xff15fef7");
    return Scaffold(
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor:Color(mycolor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Get Code',
          ),
         
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        
      ),
       body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}