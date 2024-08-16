import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kickcart_admin/blank.dart';
import 'package:kickcart_admin/users.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../../colourconst.dart';
import 'addproduct_screen.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int selectedIndex = 0;
  List<Widget> views = [
    Blank(),
    Blank(),
    categories_page(),
    Blank(),
    Users(),
    // Booked(),
    // TestDriveBooking(),
    // // product_adder(),
    //Category_page(),
    // admin_adder(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:ColorConst.lightPink,
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            theme: SideNavigationBarTheme(
                backgroundColor: ColorConst.home,
                itemTheme: SideNavigationBarItemTheme(
                    selectedItemColor: Colors.white30),
                togglerTheme: SideNavigationBarTogglerTheme(
                    expandIconColor: Colors.purpleAccent),
                dividerTheme: SideNavigationBarDividerTheme.standard()),
            header: SideNavigationBarHeader(
                image: CircleAvatar(child: Icon(Icons.person)),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Kick Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Perfect ShoesApp",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                subtitle: Text("Role: Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ))),
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(icon: Icons.all_inbox, label: 'Booked'),
              SideNavigationBarItem(
                icon: Icons.shopping_cart,
                label: 'Product',
              ),
              SideNavigationBarItem(
                icon: Icons.upload_sharp,
                label: 'AddProduct',
              ),
              SideNavigationBarItem(
                icon: Icons.admin_panel_settings,
                label: 'Admin',
              ),
              SideNavigationBarItem(
                icon: Icons.people,
                label: 'Users',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                print(selectedIndex);
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
