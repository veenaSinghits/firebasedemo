import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  final user= _auth.signInWithEmailAndPassword(
                      email: _email, password: _password).then((user) =>
                      Navigator.pushNamed(context, '/homepage')
                  );
                }
                catch(e){
                  print(e);
                }
              },
              icon: Icon(Icons.accessibility),
              label: Text("SignIn")),
          SizedBox(height: 10,),
          TextButton.icon(
              onPressed:(){
                Navigator.pushNamed(context, '/signup');
              } ,
              icon: Icon(Icons.accessibility),
              label: Text("SignUp")),
        ],
      ),
    );
  }
}