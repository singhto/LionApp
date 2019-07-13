import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String name, user, password;

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $name, user = $user, password = $password');
          uploadToServer();
        }
      },
    );
  }

  Future<void> uploadToServer() async {
    String url =
        'https://www.androidthai.in.th/lion/addDataLion.php?isAdd=true&Name=$name&User=$user&Password=$password';

    var response = await get(url);
    var result = json.decode(response.body);
    if ((result.toString()) == 'true') {
      Navigator.of(context).pop();
    }
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Display Name :',
        helperText: 'First Name and Last Name',
        hintText: 'English Only',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Name';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User :',
        helperText: 'Type User For Login',
        hintText: 'Not Blank',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Fill Your User';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password :',
        helperText: 'Type Passwowrde',
        hintText: 'Not Blank',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Type Password';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0),
        child: Container(
          width: 250.0,
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                nameText(),
                userText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
