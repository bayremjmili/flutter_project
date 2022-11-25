import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class adminpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _adminpage();
  }
}

class _adminpage extends State {
  final key = GlobalKey<FormState>();
  String password = "";
  String emailadress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Hello"),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.data_exploration),
              title: Text("App statistics"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Form(
        key: key,
        child: Column(children: [
          SizedBox(height: 40),
          TextFormField(
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (value) => {setState(() => emailadress = value)},
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return "enter a non null value";
              }
              return null;
            }),
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            obscureText: true,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (value) => {setState(() => password = value)},
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return "enter a non null value";
              }
              return null;
            }),
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Create".toUpperCase(),
            ),
          ),
        ]),
      ),
    );
  }
}
