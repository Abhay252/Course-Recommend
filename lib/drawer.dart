import 'package:flutter/material.dart';
import 'package:minip/list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 100,
              ),
            ),
            MyListTile(
              icon: Icons.home,
              text: 'HOME',
             // onTap: () => Navigator.pop(context),
            ),
            MyListTile(
              icon: Icons.person,
              text: 'PROFILE',
              //onTap: () => Navigator.pop(context),
            ),
            MyListTile(
              icon: Icons.logout,
              text: 'LOGOUT',
             // onTap: () => Navigator.pop(context),
            ),
          ],
        ));
  }
}
