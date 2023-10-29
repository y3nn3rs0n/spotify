import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push( menuItem.link);
        context.pop();
      },
      children: [
        Padding(padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
        child: const Text("Main menu"),),
        ...appMenuItems.sublist(0,3).map((menuItem) =>  NavigationDrawerDestination(
          icon: Icon(menuItem.icon), 
          label: Text(menuItem.title)),),
          const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 16),
          child: Divider(    
          ),),
             Padding(padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
        child: const Text("More options"),),
           ...appMenuItems.sublist(3).map((menuItem) =>  NavigationDrawerDestination(
          icon: Icon(menuItem.icon), 
          label: Text(menuItem.title)),),
      ]
    );
  }
}