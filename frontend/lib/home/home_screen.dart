import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Fashion App'),
    );
  }
}
