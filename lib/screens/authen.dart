import 'package:flutter/material.dart';
import 'package:lion_app/models/user_model.dart';
import 'package:lion_app/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String user, password;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Method
  Widget showText() {
    return Text(
      'Lion App',
      style: TextStyle(
        fontSize: 36.0,
        color: Colors.red[700],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 170.0,
      height: 170.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(labelText: 'User :'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'User is Empty';
          }
        },
        onSaved: (String value) {
          user = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password :'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Empty';
          }
        },
        onSaved: (String value) {
          password = value;
        },
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('user = $user, pasword = $password');
          checkAuten();
        }
      },
    );
  }

  Future<void> checkAuten() async {
    String url =
        'https://www.androidthai.in.th/lion/getUserWhereUserLion.php?isAdd=true&User=$user';
    var response = await get(url);
    var result = json.decode(response.body);
    print('result = $result');

    if ((result.toString()) == 'null') {
      // User False
      mySnackbar('No $user in my Database');
    } else {
      // User True

      for (var objJSON in result) {
        print('objJSON = $objJSON');
        UserModel userModel = UserModel.fromJson(objJSON);
        print('Name from JSON = ${userModel.nameString}');

        String truePassword = userModel.passwordString.toString();

        if (password == truePassword) {
          // Password True
        } else {
          // Password False
          mySnackbar('Please Try Again Password False');
        }
      }
    }
  }

  void mySnackbar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.blue[500],
      duration: Duration(seconds: 8),
      action: SnackBarAction(
        textColor: Colors.red,
        label: 'Close',
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget signUpButton() {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click Sign Up');

        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.blue[200]],
          begin: Alignment.topLeft,
        )),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              showLogo(),
              showText(),
              userText(),
              passwordText(),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
