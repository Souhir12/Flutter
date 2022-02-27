import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectflutter_2022/inscription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectflutter_2022/Acceuil.dart';
import 'fire_auth.dart';
import 'theme.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {
  FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  final TextEditingController mail=TextEditingController();
  final TextEditingController pass=TextEditingController();
  final _formlogin = GlobalKey<FormState>();
  bool exist=false;

  get formlogin => _formlogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0098c1),
      body: Center(

        child: Form(
          key: _formlogin,
          child: Container(
            width: MediaQuery.of(context).size.width*.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                Image.asset('assets/images/shop.jpg',width: 200,height: 200,),


                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText:"Entrer votre email",
                    labelText:"Email",
                  ),
                  controller: mail,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre email";
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
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre Mot de passe';
                    }
                    return null;
                  },

                ),

                SizedBox(height: 50.0),


                Container(
                  height: 30,
                  width:150,
                  decoration: BoxDecoration(
                    color:Colors.orange,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: ElevatedButton(


                    onPressed: ()async {





                if (_formlogin.currentState!.validate()) {
                User? user =
                await FireAuth.signInUsingEmailPassword(
                email: mail.text,
                password: pass.text,
                );

                print(user);

                if(user!=null){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Acceuil()),
                );
                }
                }

                },





                    child: Text('Se connecter'),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const inscription()),
                    );
                  },
                  child: Text("S'inscrire",style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)),
                ),
                // Container(
                //   height: 0,
                //   width:0,
                //   child: FutureBuilder(
                //
                //       future: firestore.collection("utilisateur").get(),
                //       builder:(context, snapshot) {
                //
                //
                //         QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
                //         List<QueryDocumentSnapshot> list = querySnapshot.docs;
                //
                //         return ListView.builder(
                //           itemCount: list.length,
                //           itemBuilder: (context,index){
                //             if(user.text==list[index].get("user") && pass.text==list[index].get("pass"))
                //               exist=true;
                //             usercnx=user.text;
                //             passcnx=pass.text;
                //             // if (exist) {
                //             //   Navigator.push(context, MaterialPageRoute(
                //             //       builder: (context) => const Acceuil()),
                //             //   );
                //             // }
                //             return Text("");
                //           },
                //
                //
                //         );
                //       }
                //   ),
                // ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
