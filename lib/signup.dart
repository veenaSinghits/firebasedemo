import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget{
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final _auth=FirebaseAuth.instance;
  String _email;
  String _password;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Email"),
            onChanged: (value){
              _email=value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Passowrd"),
            onChanged: (value){
              _password=value;
            },
            obscureText: true,
          ),
          SizedBox(height: 10,),
          TextButton.icon(
              onPressed: ()async{
                try{
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  if(newuser!=null){
                    Navigator.pushNamed(context, '/homepage');
                  }
                }
                catch(e){
                  print(e);
                }
              },
              icon: Icon(Icons.accessibility),
              label: Text("SignUp")),
        ],
      ),
    );
  }
}