import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/Product.dart';
import 'package:frontend/details/details_screen.dart';

import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          // padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
          child: Center(
            child: Text(
              "Products",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
