import 'package:flutter/material.dart';

import 'global_variables.dart';
import 'home_body.dart';
import 'profile_screen.dart';
import 'side_drawer.dart';

class HomeScreen extends StatefulWidget {
  int selectedIndex=0;
  HomeScreen({required this.selectedIndex});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  var title = 'Pending Orders';
  final ScrollController _homeController = ScrollController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeBody(title: 'Pending'),
    HomeBody(title: 'Delivered'),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex=index;
      _selectedIndex = widget.selectedIndex;
      if(_selectedIndex==0)
      {
        setState(() {
          title='Pending Orders';
        });
      }
      else if(_selectedIndex==1)
        {
          setState(() {
            title='Delivered';
          });
        }
      else
      {
        setState(() {
          title='My Profile';
        });
      }
    });
  }
  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(fun: (){},),
      appBar: AppBar(
        centerTitle: true,
        title:Text(_selectedIndex==0?'Pending Orders':_selectedIndex==1?'Delivered':'My Profile',style: Theme.of(context).textTheme.headline3),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: 'Pending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Delivered',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
