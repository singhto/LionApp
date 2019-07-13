import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit

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
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password :'),
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {},
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
    return Scaffold(resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.blue[200]],begin: Alignment.topLeft,
        )),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
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
    );
  }
}
