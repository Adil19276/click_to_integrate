import 'package:click_to_integrate/add.dart';
import 'package:click_to_integrate/color.dart';
import 'package:click_to_integrate/home_page.dart';
import 'package:click_to_integrate/profile/profile_screen.dart';
import 'package:click_to_integrate/refurbished_dummy.dart';
import 'package:click_to_integrate/store_dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';

class bottom_navbar extends StatefulWidget {
  const bottom_navbar({super.key});

  @override
  State<bottom_navbar> createState() => _bottom_navbarState();
}

class _bottom_navbarState extends State<bottom_navbar> {
  String page = 'Home';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: Themeoffwhitecolor,
        buttonSelectedColor: Colors.orange,
        fabColors: [Colors.orange, Color(0xFFF9B563)],
        fabIcon: Icon(Icons.add, color: Colors.white),
        
        buttonData: [
          PandaBarButtonData(
              id: 'Home', icon: CupertinoIcons.home, title: 'Home'),
          PandaBarButtonData(
              id: 'Store', icon: CupertinoIcons.bag, title: 'Store'),
          PandaBarButtonData(
              id: 'Red', icon: Icons.storefront_outlined, title: 'Refurbished'),
          PandaBarButtonData(
              id: 'Yellow', icon: CupertinoIcons.person, title: 'Profile'),
        ], 
        
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          setState(() {
            page = 'Add';   
          });
          
        },
        
      ),
      body: Builder(
        builder: (context) {
          switch (page) {
            case 'Home':
              return home_page();
            case 'Store':
              return store_dummy();
            case 'Red':
              return refurbished_dummy();
            case 'Yellow':
              return profile_screen();
               case 'Add':
              return add();  
            default:
              return Container();
          }
        },
      ),
    );
  }
}


