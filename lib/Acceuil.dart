import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectflutter_2022/constants.dart';
import 'screens/home/components/body.dart';
import 'Login.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}
class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),

      body: Body(
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Mon compte'),
            ),
            ListTile(
              title: const Text('Deconnexion'),
              onTap: ()async {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Login()),
                );
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {

    return AppBar(
      backgroundColor: Color(0xFF0098c1),
      title: Text("Shop"),
      automaticallyImplyLeading: true,

      actions: <Widget>[



        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,

          ),
          onPressed: () {},
        ),

        SizedBox(width: kDefaultPaddin / 2)
      ],
    );

  }


}