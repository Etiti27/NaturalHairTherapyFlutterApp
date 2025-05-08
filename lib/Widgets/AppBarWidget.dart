import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        // centerTitle: true,
        backgroundColor: const Color(0xff8ba870),
        leading: PopupMenuButton<String>(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ), // Use menu icon or any other icon
          onSelected: (String result) {
            print(result);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Start My Action Plan',
              child: ListTile(
                leading: Icon(Icons.rocket_launch),
                title: Text('Start My Action Plan'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Track My Progress',
              child: ListTile(
                leading: Icon(Icons.track_changes),
                title: Text('Track My Progress'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'My Goal Summary',
              child: ListTile(
                leading: Icon(Icons.summarize),
                title: Text(
                  'My Goal Summary',
                ),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Settings',
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Logout',
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
        title: const ListTile(
          leading: Image(
            image: AssetImage("assets/images/logo.png"),
            color: Colors.white,
          ),
          title: Text(
            "Nat'rel",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontStyle: FontStyle.normal,
              fontFamily: "Roboto-Bold",
            ),
          ),
          subtitle: Text(
            "We Help You Grow Your Hair",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
              fontStyle: FontStyle.normal,
              fontFamily: "Roboto-Bold",
            ),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ), // Menu icon in AppBar
            onSelected: (String result) {
              print(result); // Perform actions based on the selected item
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ),
            ],
          ),
        ],
        elevation: 1.0,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
