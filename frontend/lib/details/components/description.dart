import 'package:flutter/material.dart';
import 'package:frontend/models/Product.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      margin: EdgeInsets.fromLTRB(5, 115, 5, 5),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
