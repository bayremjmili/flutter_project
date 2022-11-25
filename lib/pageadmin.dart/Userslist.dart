import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'appstate.dart';

class userlist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _userlist();
  }
}

class _userlist extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin page"),
        backgroundColor: kPrimaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Admin",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text("Users List"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userlist()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.data_exploration),
              title: Text("App statistics"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => stateapp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(),
    );
  }
}
