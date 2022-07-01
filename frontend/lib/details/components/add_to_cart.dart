import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/models/Product.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../payment.dart';
import './cart_counter.dart' as cart;

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.only(right: kDefaultPaddin),
          //   height: 50,
          //   width: 58,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(18),
          //     border: Border.all(
          //       color: product.color,
          //     ),
          //   ),
          //   // child: IconButton(
          //   //   icon: SvgPicture.asset(
          //   //     "assets/icons/add_to_cart.svg",
          //   //     color: product.color,
          //   //   ),
          //   //   onPressed: () {},
          //   // ),
          // ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: product.color,
                onPressed: () async {
                  await store(cart.numOfItems);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Payment_page()));
                },
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  store(int numOfItems) async {
    String items = numOfItems.toString();
    var res = await http.post("http://localhost:5000/items",
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'no_of_items': items,
          'product_name': product.title
        });
  }
}
