import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/models/Product.dart';

import '../../../constants.dart';
import '../../payment.dart';

var numOfItems = 1;

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  bool _isButtonDisabled;
  @override
  void initState() {
    _isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              _isButtonDisabled = false;
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
              // if our item is less  then 10 then  it shows 01 02 like that
              numOfItems.toString().padLeft(2, "0"),
              // style: Theme.of(context).textTheme.headline6,
              style: TextStyle(color: Colors.black)),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              if (numOfItems > 4) {
                _isButtonDisabled = true;
              } else {
                setState(() {
                  numOfItems++;
                });
              }
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: _isButtonDisabled ? null : press,
        child: Icon(icon),
      ),
    );
  }
}
