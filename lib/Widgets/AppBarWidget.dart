import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({required this.logo, required this.title});
  Widget logo;
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff8ba870),
      leading: Container(
          decoration: BoxDecoration(color: Colors.white), child: logo),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          // fontSize: 20.0,
          fontStyle: FontStyle.normal,
          fontFamily: "Roboto-Bold",
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          iconColor: Colors.white,
          onSelected: (String value) {
            print('Selected: $value');
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'Settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem<String>(
              value: 'Logout',
              child: Text('Logout'),
            ),
          ],
        ),
      ],
      elevation: 1.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
