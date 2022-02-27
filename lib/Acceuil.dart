import 'package:flutter/material.dart';
class Acceuil extends StatefulWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0098c1),

      appBar:AppBar(
        title: Text("Shop"),
        leading: GestureDetector(
          child: Icon(
            Icons.menu,  // add custom icons also
          ),
        ),

        ),
    


    body: Center(),
    );
  }
}
