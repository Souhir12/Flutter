import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'fire_auth.dart';

class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  _inscriptionState createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {

  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  final TextEditingController name=TextEditingController();
  final TextEditingController pass=TextEditingController();
  final TextEditingController mail=TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0098c1),
      appBar: AppBar(
        title:Text('Inscription'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width*.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText:"Entrer votre nom d'utilisateur",
                    labelText:"Nom d'utilisateur",
                  ),
                  controller: name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    print("555555555555");
                    print(value);
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom d utilisateur';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText:"Entrer votre Email",
                    labelText:"Email",
                  ),
                  controller: mail,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    print("*************************");
                    print(value);
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre Email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText:"Entrer votre mot de passe",
                    labelText:"Mot de passe",
                  ),
                  controller: pass,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    print("pass");
                    print(value);
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre Mot de passe';
                    }
                    return null;
                  },

                ),

                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () async{

                    if(_formKey.currentState!.validate()) {
                      User? user =
                      await FireAuth.registerUsingEmailPassword(
                        name: name.text,
                        email: mail.text,
                        password: pass.text,
                      );

                      print(user);
                      // await firestore.collection("utilisateur").add({
                      //   "user": user.text,
                      //   "Email": mail.text,
                      //   "pass": pass.text
                      // });
                      name.clear();
                      pass.clear();
                      mail.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Inscription'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
