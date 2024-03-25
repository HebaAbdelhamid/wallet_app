import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wallet_app/Screens/add_expenses.dart';
import 'package:wallet_app/Screens/category_chart.dart';
import 'package:wallet_app/Screens/home.dart';
import 'package:wallet_app/Screens/income_chart.dart';
import 'package:wallet_app/Screens/profile.dart';
import 'package:wallet_app/Screens/saving.dart';

class Botton_Navigation_Bar extends StatefulWidget{


   @override
  State<StatefulWidget> createState() {
    return Botton_Navigation_State();
  }

}
class Botton_Navigation_State extends State<Botton_Navigation_Bar>{
  List<Widget> _buildScreens() {
    return [
      Home(0),
      Income_Chart(),
      AddExpensesPage_(),
      FuturePlanning(),
      Profile()
    ];
  }
  /*List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home,size: 30,),
        activeColorPrimary: Color(0xFF294B29),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart,size: 34, ),
        activeColorPrimary: Color(0xFF294B29),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add,color: Colors.white,),
        activeColorPrimary: Color(0xFF294B29),
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bookmark_outlined,size: 28,),
        activeColorPrimary: Color(0xFF294B29),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.perm_identity_rounded,size: 35,),
        activeColorPrimary: Color(0xFF294B29),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/
  var _selectedIndex=0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;


    _controller = PersistentTabController(initialIndex: 0);
    return Scaffold(
      body: _buildScreens()[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF294B29),
        child: Icon(Icons.add,),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AddExpensesPage_()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outlined),
            label: 'Saving',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_rounded),
            label: 'Profile',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped
      ),

     /* bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15	 // Choose the nav bar style with this property.
      ),*/

    );
  }

}

