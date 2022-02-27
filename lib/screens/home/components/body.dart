import 'package:flutter/material.dart';
import 'package:projectflutter_2022/constants.dart';
import 'package:projectflutter_2022/models/Product.dart';
import 'package:projectflutter_2022/screens/details/details_screen.dart';

import 'categorries.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style:TextStyle(fontWeight:FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ));
                  },
                  child: ItemCard(
                        product: products[index],
                      ),
                )),
          ),
        ),
      ],
    );
  }
}
