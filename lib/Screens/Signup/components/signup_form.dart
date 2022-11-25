import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/pageadmin.dart/Userslist.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpForm();
  }
}

class _SignUpForm extends State {
  String password = "";
  String emailadress = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => {setState(() => emailadress = value)},
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return "enter a non null value";
              }
              return null;
            }),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              onChanged: (value) => {setState(() => password = value)},
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "enter a non null value";
                }
                return null;
              }),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: onsubmit,
            child: Text("Create".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  Future<void> authentificate(emailadress, password) async {
    try {
      print(emailadress);
      print(password);

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailadress, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("l'utilisateur est creer")));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => userlist()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('user-not-found')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('wrong-password')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("error${e.toString()}")));
      }
    }
  }

  onsubmit() {
    if (_formKey.currentState!.validate()) {
      authentificate(emailadress, password);
    }
  }
}
